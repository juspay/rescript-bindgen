# #194 — global-only declaration packages (`@webgpu/types`)

Status: DRAFT (design) — research + approach validated against the compiler; not yet implemented.
Issue: https://github.com/juspay/rescript-bindgen/issues/194 · depends on #193 (Windows scratch-cache path, merged).

## §0 The problem, precisely

A global-only `.d.ts` (e.g. `@webgpu/types@0.1.71`, 3,417 lines) has **no module symbol** — the file is a
global-augmentation *script*, not a module. `extractModule` acquires the entry's module symbol and throws
when there isn't one:

```
src/extract.mjs:2946   if (!moduleSymbol) throw new Error(`No module symbol for ${entryFile}`)
src/extract.mjs:2947   const exports = checker.getExportsOfModule(moduleSymbol)   // everything roots off this
```
(The comment at extract.mjs:2922-2924 already anticipates #194.) Even past that gate, `@module("@webgpu/types")`
would be **wrong** — there is no runtime module to import — and top-level global declarations aren't
generation roots today.

### What `@webgpu/types` actually contains (profiled)
- **114 `interface`** — the instance shapes (`GPU`, `GPUAdapter`, `GPUDevice`, `GPUBuffer`, …), readonly
  props + methods.
- **39 `declare var GPUXxx: { prototype: GPUXxx; new(): GPUXxx; … }`** — the constructor objects (the classic
  TS "global class" pattern: instance `interface` + constructor `var`). Mostly for `instanceof`; WebGPU
  objects are obtained via `device.createBuffer(...)`, not `new`.
- **74 `type`** aliases (incl. string-literal-union enums like `GPUTextureFormat`).
- **DOM augmentations** (declaration merging onto existing lib.dom globals): `Navigator`/`WorkerNavigator`
  gain `readonly gpu: GPU`; `HTMLCanvasElement`/`OffscreenCanvas` gain `getContext("webgpu"): GPUCanvasContext
  | null`. There are **no `declare global` blocks** — the file itself is global, so its declarations already
  are.

The real entry path a user needs: `navigator.gpu` → `requestAdapter()` → `requestDevice()` → `createBuffer()`
… plus static flag constants (`GPUBufferUsage.MAP_READ`).

## §1 The key insight — INSTANCE members reuse; roots + ctors + statics + overload-provenance are new

Interface **instance** members already emit as `@send` (methods) / `@get`/`@set` (properties), and **none of
those emit an import** — only `@module` does. That per-member layer is reusable. But design-review against the
real package (TS 6.0.3) showed the surface is wider than "only roots change":
- the **root binder** (global value/scoped access) is new: `@val` / `@val @scope(tuple)`, never `@module`;
- **constructors** and **statics** currently bake in `@module` in emit (`@new @module` at emit.mjs:674;
  `@module @scope` statics at 718/723) — they need `@module`-free variants;
- **overload provenance**: `buildClassIR` collapses to `getCallSignatures()[0]`, which for an augmented member
  (`HTMLCanvasElement.getContext` has 6 signatures — 5 lib.dom + 1 in-package `"webgpu"`) picks the WRONG
  (lib.dom) overload — global mode needs *signature-level* provenance selection;
- **flag-const interfaces** (`GPUBufferUsage`) need a dedicated `@val @scope` const binder, not instance getters.

So: instance-member emission is reused; the root binder, ctor binder, static/flag-const binder, and
per-declaration/per-signature provenance selection are new code.

**Compiler-verified** (a representative slice built cleanly in `test/sandbox` under the pinned ReScript):

```rescript
type gpu; type gpuAdapter; type gpuDevice; type gpuBuffer; type gpuAdapterInfo
@val @scope("navigator") external gpu: gpu = "gpu"                          // navigator.gpu
@send external requestAdapter: gpu => promise<Nullable.t<gpuAdapter>> = "requestAdapter"
@send external requestDevice: gpuAdapter => promise<gpuDevice> = "requestDevice"
@get  external info: gpuAdapter => gpuAdapterInfo = "info"
@get  external size: gpuBuffer => float = "size"
@set  external setLabel: (gpuBuffer, string) => unit = "label"
@val @scope("GPUBufferUsage") external mapRead: int = "MAP_READ"
@new  external makeAdapterInfo: unit => gpuAdapterInfo = "GPUAdapterInfo"
```
emits, with **zero imports**:
```js
async function demo(){ let adapter = await navigator.gpu.requestAdapter(); if(!(adapter==null)){ await adapter.requestDevice(); } new GPUAdapterInfo(); }
```
That is exactly the issue's acceptance shape (`navigator.gpu.…`, `new GPUXxx()`, no runtime `@webgpu/types`
import).

## §2 Detection — enter GLOBAL mode at the extractModule skip site

The gate is **`extractModule` (the `--pkg` path), extract.mjs:3024** — where a module-less entry *already*
degrades to a recorded skip (`no-module-symbol … see #194`), NOT the throw at extract.mjs:2946 (that is
`extractComponent`, the `--file` path). Branch the 3024 skip into global-mode extraction. (`--file` global
input is a separate, optional add at 2946 — out of scope for v1.) This keeps the change purely additive:
module/ambient entries never reach the global branch, so their output stays byte-identical.

At that point, branch to global mode when the entry is a global script with
top-level global declarations (iterate `source.statements` for `interface` / `declare var` / `type` /
augmentations), rather than throwing. A genuinely empty/broken entry still reports (never a silent crash or a
bogus `@module`). **Auto-detected**, not flag-gated: a global-only package has *no* module symbol, so global
mode can never collide with module mode ("normal importable-package behavior must remain unchanged" — issue).
A `--globals` override can force it if a hybrid ever needs it (decide in impl; auto is the default).

## §3 Roots, traversal, and the emission contract

Generation roots in global mode are the top-level global declarations:

| TS global shape | ReScript emission | import? |
|---|---|---|
| `declare var x: T` (plain value) | `@val external x: t = "x"` | no |
| nested access `a.b.c` | `@val @scope(("a","b")) external c: t = "c"` | no |
| interface method `m(a): R` | `@send external m: (t, a) => r = "m"` | no |
| interface readonly prop `p: P` | `@get external p: t => p = "p"` | no |
| interface mutable prop | `@get` + `@set` | no |
| `declare var C: { new(a): C }` | `@new external makeC: a => c = "C"` | no |
| static `C.S` (const/method on the ctor object) | `@val @scope("C") external s … = "S"` | no |
| `interface C` (instance shape) | abstract `type c` | no |

**Never `@module` in global mode.** Reuses the existing class/opaque member emission for `@send`/`@get`/`@set`;
the new code is the root binder (`@val`/`@scope`/`@new`) and the global-roots traversal.

**OWN-FILES SCOPING (critical correctness rule — the merge is TOTAL, not augmentation-only).** TS's own
`lib.dom.d.ts` (v6.0.3) already ships the ENTIRE WebGPU API, so **every** one of the 114 GPU* interfaces is a
MERGED lib.dom+package symbol — not just `Navigator`/`HTMLCanvasElement`. The provenance filter therefore runs
at three levels, always as `.some(decl in pkgDir)` (NOT `declarations[0]`, which is frequently the lib.dom
one):
- **roots**: an interface/var is a root only if it has ≥1 declaration in the package dir (all 114+39 do; a
  pure lib.dom type reached only by reference is not a root);
- **members**: bind a property/method only if `symbol.declarations.some(d => inPkg(d))` — lib-duplicated
  members are expected and still bound; a member declared *only* in lib.dom (e.g. the 44 other `Navigator`
  props) is skipped;
- **signatures**: for an overloaded member, select the in-package signature, not `getCallSignatures()[0]`
  (`getContext` has 6 sigs; `[0]` is lib.dom's `"2d"`, the in-package one is `"webgpu"`).

Enumerate members via **type properties** (`getPropertiesOfType`), not syntactic interface members — the
`.gpu` entry lives on `NavigatorGPU` and reaches `Navigator` through `extends`, so `interface Navigator`'s own
body is empty. And **fold augmentation-helper interfaces** (`NavigatorGPU`) so we don't emit a stray
`type navigatorGPU` + duplicate `gpu` getter. `inPkg(d)` = `d.getSourceFile().fileName` under the resolved
package dir — an allowlist (safer than `isInherited`'s `@types|typescript|lib` blocklist).

### §3.1 Constructors — recover the discriminator from the IN-PACKAGE declaration
The source marks instanceof-only ctors `new (): never` (29/39), but the MERGED static type reports
`new(): GPUBuffer` (lib.dom's `new` wins the merge), so the `never` signal is gone post-merge. Read the
construct signature off the **in-package `declare var` declaration itself** (`sig.declaration`'s source file
in-pkg), not the merged symbol type. Bind `@new external makeC: (…) => c = "C"` only for a genuinely
constructible ctor (in-package `new` with real params — `GPUValidationError`, `GPUPipelineError`, …); flag the
instanceof-only ones (`report`, don't invent a call site).

### §3.2 Flag-const interfaces (`GPUBufferUsage`, `GPUColorWrite`, …)
Shape: `interface X { readonly MAP_READ: number; … }` + `declare var X: X` (typed AS the interface, zero
construct signatures). Fed naively to `buildClassIR` these emit `@get external mapRead: t => int` (an instance
getter on an abstract `t`) — WRONG. Detect the shape (the var's type has no construct signature and equals the
interface) and route to a **const-namespace binder**: `@val @scope("GPUBufferUsage") external mapRead: int =
"MAP_READ"`.

### §3.3 Statics on constructor objects
Static members live on the `declare var`'s object type, not as `ModifierFlags.Static` (which the existing
static loop at extract.mjs:2875 requires), so reuse doesn't capture them — bind them via the same
`@val @scope("C")` const/function binder as §3.2.

### §3.4 Hybrid packages (module exports + `declare global`) — report, don't drop
A package with BOTH module exports and global augmentations has a module symbol → module mode → its globals
are silently skipped, violating the issue's "report unsupported globals" AC. In module mode, also scan
`source.statements` for in-package top-level NON-exported global declarations and record them as skipped (or
emit them under an explicit `--globals`). v1: at least REPORT them.

**DOM augmentations** (`Navigator.gpu`, `HTMLCanvasElement.getContext`): emit ONLY the added members bound onto
an abstract handle for the existing global — default self-contained (`@val external navigator: navigator =
"navigator"` + `@get external gpu: navigator => gpu = "gpu"`; `@send external getContextWebgpu:
(htmlCanvasElement, string) => Nullable.t<gpuCanvasContext> = "getContext"`), NOT redefining the whole lib.dom
type. Optionally alias the handle to `Webapi.Dom.*` under `--webapi` (mirrors the existing File/FileList
fallback). Never re-emit the base DOM interface.

**Constructor vars:** bind `@new` only when there's a usable `new` signature the user would call; the
`instanceof`-only WebGPU ctors can be bound harmlessly or flagged (decide by whether the `new` sig is
non-trivial). Static flag interfaces (`GPUBufferUsage`) → `@val @scope` consts.

## §4 Fidelity & flagging (existing contract, unchanged)
- `GPUAdapter | null` → `Nullable.t<…>` / option; string-literal-union enums (`GPUTextureFormat`) → the existing
  polyvar / `@as` mapping; `unknown` → `JSON.t`.
- Anything unmodellable → `string` placeholder + comment + bucket (⚪/🔍/🛑); **report unsupported globals
  explicitly** (issue AC), never silently drop.
- No unsafe casts (`Obj.magic`/`@unwrap`/stray `%identity`) — the contract holds; global bindings are ordinary
  externals.

## §5 Scope — phased (design review widened the surface)

**Phase 1 (v1 — delivers the issue's core acceptance criteria):**
- global-mode detection at extractModule:3024; root enumeration via `source.statements` with
  `.some(inPkg)` provenance on interfaces / members / signatures;
- INSTANCE members (`@send`/`@get`/`@set`, reused) for the GPU* interfaces;
- the real entry path — `navigator.gpu → requestAdapter → requestDevice → createBuffer …` — via
  type-property enumeration + augmentation-helper folding (`NavigatorGPU`), and the canvas
  `getContext("webgpu")` augmentation via signature-level provenance;
- flag-const namespaces (`GPUBufferUsage.MAP_READ` → `@val @scope`) and constructor-object statics;
- a **self-contained global-only golden fixture** (mini WebGPU-slice `index.d.ts` + augmentations,
  `args.json`, no install) exercising the mode offline (issue AC), compiled in the sandbox;
- end-to-end `--pkg @webgpu/types` gets past extraction, a representative slice compiles, **no runtime import**;
- **module + ambient fixtures byte-identical** (global mode is the additive 3024 branch).

**Phase 2 (edges):** `@new` constructors (in-package construct-sig discriminator; ≥1-param bind, flag the
rest); hybrid-package global REPORTING (§3.4); `--file` global input (extractComponent:2946). Deferred so v1
lands the usable happy path first.

## §6 Risks
- **Global-script vs broken entry** — detect real top-level global decls before entering the mode; otherwise
  report (don't crash, don't `@module`).
- **Augmentation merging** — bind only the ADDED member on an abstract handle; never redefine `Navigator` /
  `HTMLCanvasElement` (lib.dom already declares them).
- **`instanceof`-only ctors** — bind harmlessly or flag; don't invent call sites.
- **Mode isolation** — module/ambient output must stay byte-identical; the global branch only runs when there
  is no module symbol.
- **`@scope` tuple depth** — nested globals need `@scope(("a","b"))`; verified against the manual.
