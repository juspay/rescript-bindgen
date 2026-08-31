# #211 — Shaped in-place bound resolution for a constrained type param buried in a generic wrapper

Status: IMPLEMENTED (Approach B; design-review amendments folded in)
Issue: https://github.com/juspay/rescript-bindgen/issues/211 · Follow-up to #192.

Shipped: `openPrimitiveIdiom`-style boolean `ctx.resolveBound` key dimension in `keyOf`, enum-no-tag in
`registerNamed`, `rbNameSuffix` on the record base, `relinkRb`/`publicAnchor` reading stamps, and
`rebuildStuckParam`/`boundNameToken`/`isRecordishRef` driving the re-classify at `demoteNonRoundTrip`'s
former degrade point. Verified: base-ui `useRender` param → shaped `{state: Dict.t<JSON.t>, …}`; all 125
goldens + compile green; bench byte-identical except the base-ui win; blend unchanged.

## §0 Plain English — the concrete triple (real case: base-ui `useRender`)

**① The TypeScript** (`@base-ui-components/react/use-render/useRender.d.ts`):
```ts
function useRender<State extends Record<string, unknown>, RenderedElementType extends Element, …>(
  params: useRender.Parameters<State, RenderedElementType, …>
): useRender.ReturnValue<…>

interface UseRenderParameters<State, RenderedElementType extends Element, …> {
  render?: …
  ref?: React.Ref<RenderedElementType> | …
  state?: State                    // ← the constrained var, buried one level down
  props?: Record<string, unknown>
  enabled?: Enabled
}
```
`State extends Record<string,unknown>` is **param-only** (it never appears in the return), so it should
resolve to its bound. But it sits INSIDE the `Parameters<State,…>` wrapper record.

**② What we generate today** — the whole wrapper is thrown away and collapsed to a flagged `string`:
```rescript
@module("@base-ui-components/react") external useRender: (string) => string = "useRender"
```

**③ What we should generate** — the wrapper stays shaped AND the bound is honored:
```rescript
type useRenderParameters = {
  ref?: React.ref<Dom.element>,   // RenderedElementType extends Element → Dom.element
  state?: Dict.t<JSON.t>,         // State extends Record<string,unknown> → Dict.t<JSON.t>
  props?: Dict.t<JSON.t>,
  enabled?: bool,
  …
}
external useRender: (useRenderParameters) => React.element = "useRender"
```

The synthetic reduction of the same shape: `boxParam<T extends string>(x: Box<T>)` where
`interface Box<T>{v:T}` → today `(string) => unit` 🛑; ideal `({v: string}) => unit`.

**Must NOT change (the round-trip carve-out from #192):** `boxRoundTrip<T>(x: Box<T>): Box<T>` — `T`
flows in *and back out*, so it is genuinely polymorphic and stays `box<'a> => box<'a>`. Resolving it
would over-restrict a parametric function.

## §1 The defect precisely

`demoteNonRoundTrip` (`src/extract.mjs:2439-2494`) already decides per-var via `typeParamMode`
(`:2420-2425`): round-trip → keep `'a`; return-only / param-only-constrained → resolve to bound. It
substitutes the bound with `substTypeVars` (`:2400`), which rewrites `typeVar` **nodes**. But a var
carried inside a `typeRef`'s `tparams` — an array of NAME STRINGS, not nodes (`box<'a>`) — is
unreachable by `substTypeVars`. The deep `collectStuckVars` (`:956`) *detects* the survivor, and the
code then **degrades the whole param to `{kind:'unknown'}` → flagged `string`** at **`:2488`**. Its own
comment (`:2479-2487`) names the intended upgrade and defers it to #211.

So `boxParam` → `string` 🛑; every param-only constrained var buried in a wrapper is lost, wrapper
shape and all.

## §2 ReScript 12 findings (researched, cited)

ReScript 12 has **no bounded/constrained type variable** — no `'a extends string`. The near analogues
don't apply: open-object row polymorphism (`{.."f":t} as 'a`) needs a NAMED field to anchor on, so it
can't restrict to bare `string` nor to a fieldless `Record<string,unknown>`; poly-variant bounds
(`[> #A]`) restrict only variant tags; GADT/functor encodings buy the restriction only by making
callers pass modules (wrong ergonomics for a data param). Therefore, for a **param-only** constrained
var, the maximally-safe faithful mapping is to **resolve the bound in place and instantiate the wrapper
concretely**. Leaving it `'a` is *unsound* — `box<'a>` accepts `Box<number>` though `T extends string`
forbids it (compiler-verified). Round-trip vars stay `'a` (parametric polymorphism, the correct model).

Sub-mappings (v12 stdlib, verified): `Record<string,unknown>` → `Dict.t<JSON.t>` (dict of opaque JSON;
`Dict.t` is the v12 name, `Js.Dict.t` is legacy) · `unknown` → `JSON.t` · `HTMLElement`/`Element` →
`Dom.element`. Sources: rescript-lang.org v12 manual (Type, Polymorphic Variant, Dictionary, JSON),
Stdlib.Dict/Json, the "Generic Constraints" forum thread, the v12 release post.

## §3 The keying blocker (why this isn't a one-liner) — corrected after design review

Registry entries are keyed by the TS `type.id` (`entryKey(ctx,type)` → `keyOf(type.id, ctx.noPolyTag)`,
`:5038-5049`; `recordNode` short-circuits on `ctx.shared.byKey.has(key)`, `:6682-6683`). **Correction
(design-review probe):** each function's `Box<T>` is a DISTINCT instantiation — `boxParam`'s is
`type.id=91`, `boxRoundTrip`'s is `94`, `boxNum<T extends number>`'s is `103`, all sharing
`target.id=88`. The key is the *instantiation* id, not the target — so two functions do **not** collide
on one key. Today's single `wrap<'a>` entry is the product of **`bySig` structural dedup** (`:6760-6769`),
not a shared id.

So the coexistence problem is **narrower** than "one id, two readers": WITHIN `boxParam` alone, the
pre-demote pass already classified `Box<T>` → `wrap<'a>` under `id:91`; the #211 rebuild re-classifies
the SAME `id:91` and must NOT hit the `byKey.has` short-circuit at `:6683` returning that generic entry.
A second read-dimension on the key lets the concrete `{v:string}` register under `id:91|rb` alongside the
generic `id:91`, and `bySig` then merges identical concrete shapes across functions. (There is no
`Box<string>` source id to borrow — unlike #177's genuinely-distinct instantiations.)

**The registry is NOT one keyspace behind `keyOf` — this is the load-bearing subtlety (review finding).**
A read-dimension must be applied per entry-kind, or it corrupts other keyspaces:

| Entry kind | Key site | Structural dedup | Dimension policy |
|---|---|---|---|
| record / tagVariant | `entryKey`→`keyOf` (`:6682`,`:6564`) | **yes** (`bySig`) | **tag it** — coexist; identical shapes merge ✓ |
| **enum** | `registerNamed`→`keyOf` (`:5057`, from `:4848`/`:5715`) | **no** | **do NOT tag** — an enum shape never contains a var, so the generic entry is always the correct reuse; tagging would double-register `flag`/`flag2` |
| **opaqueUnion / overload module** | hand-built `'t:'+id` (`:5107`,`:5356`) — bypasses `keyOf` | bySig only after the short-circuit | **out of scope v1** — keep flagged (see §4) |
| unboxed `u:`/`lu:` | structural key (`:5946`,`:4997`) | inherent | self-dedups — untouched ✓ |

## §4 Approach — B (re-classify unregistered, boolean read-dimension). A is dead.

**Approach A (synthesize the TS type `Box<string>` and classify it) is empirically infeasible:**
`getBaseConstraintOfType(Box<T>)` → `undefined`; `createTypeReference` is internal/absent; no
reparse/synthesized-location facility. The only working sub-mechanism — reading `Box<T>.v` back as the
param `T` whose constraint is `string` — is exactly what classify already does at `:4232-4246`. A
collapses into B.

**Approach B:** at the `:2488` degrade point, re-run `classify` on the stuck param's TS type with the
stuck var(s) **temporarily removed from `ctx.typeVars`** (siblings kept) and a new boolean reading flag
**`ctx.resolveBound`** set — classify resolves each occurrence to its bound in place via `:4243-4244`,
recursively through nested wrappers. The new machinery:

- **`ctx.resolveBound`** — a boolean reading flag, mirroring `ctx.noPolyTag` exactly. **Not** a
  bound-derived string: the review proved each source instantiation already has its own `type.id`, so
  two genuinely-different concrete shapes can never need the same `id:N|rb` slot — a boolean suffices for
  coexistence and `bySig` merges identical shapes. (This deletes the entire "sorted bound-anchor tag"
  determinism/collision surface the earlier draft worried about.)
- **`keyOf(id, np, rb)`** → `'id:'+id + (np?'|np':'') + (rb?'|rb':'')` — the ONE formatter (`:5047`).
  A **no-op when unset** (existing keys unchanged, byte-identical). `entryKey` reads `ctx.resolveBound`.
  **Enum exception:** `registerNamed` for `kind:'enum'` passes `rb=false` (§3 table) so enums always
  reuse the generic entry — no `flag`/`flag2`.
- **Naming (separate from the key):** `recordNode`'s base (`:6695-6697`) appends the resolved bound when
  `ctx.resolveBound` is set, so the concrete entry is `wrapString` (positional for multi-var wrappers,
  e.g. `parametersDictJsonDomElement`), not a counter-suffixed `wrap2`. Key correctness comes from
  `type.id`; the name is cosmetic-but-stable.
- **`relinkRegistered`:** the past-depth truncation node minted at `:4164` (`{kind:'opaque', relinkId,
  relinkNp}`) must also stamp `relinkRb: ctx.resolveBound`, and the post-pass read at `:3338`
  (`keyOf(t.relinkId, t.relinkNp, t.relinkRb)`) must pass it — else a truncated concrete field re-links
  to the generic `box<'a>`. `publicAnchor` (`:255`) needs a parallel `|reading:resolve-bound` suffix so
  two concrete entries on one path don't collide to a counter.
- **Structural dedup** (`bySig`) still merges identical concrete shapes across call sites.

**Scope of v1 — RECORD wrappers only (tagVariant excluded post-review).** A top-level `tagVariant`
(heterogeneous-discriminated-union) wrapper is EXCLUDED alongside union/overload wrappers: its deep case
bottoms out in a generic-accessor opaque module (`from*<'a>`) — the same `'a`-escape hatch — so it stays
the flagged `string` (`isRecordishRef` accepts only `kind:'record'`). A HOMOGENEOUS discriminated union
collapses to a record and IS concretized; a tagVariant reached as a FIELD inside a record wrapper is
still built (sound — `|rb` keying + the record-chain closure-walk gate + past-MAX_DEPTH degradation; a
live-typevar heterogeneous union becomes an opaque module, not a tagVariant, so a generic tagVariant twin
never actually arises — the tagVariant `_heal.type` read by `srcGeneric` is correct belt-and-suspenders,
not load-bearing). The
concrete rebuild fires only when the stuck param's shape is a record (base-ui `useRender`'s `Parameters`
is a record; blend's
`ColumnDefinition<T>` wrappers are records). A stuck var inside an **opaqueUnion/overload** wrapper
(`unionParam<T extends string>(x: Wrap<T> | Other)`, the `'t:'` keyspace) **keeps today's flagged
`string`** — the `:2488` report is gated to record/tagVariant refs, so the `t:` path is never fed a
tagged read and cannot regress the existing `unionParam` golden. Concretizing union/overload wrappers is
a tracked follow-up.

## §5 Implementation (all `src/extract.mjs`)

1. **`demoteNonRoundTrip` — report, don't degrade.** At `:2488`, when a param-only-resolved var survives
   in the substituted node AND that node is a **record/tagVariant** ref (v1 scope, §4), return the stuck
   param index + resolved var→bound(TS type) map on the `stuck` channel instead of `{kind:'unknown'}`.
   Plumb `stuck` consistently on ALL exits (`:2457`/`:2488`/`:2492`/`:2493`) so callers read one shape.
   Keep `{kind:'unknown'}` for: an unresolvable bound (unbounded / `T extends unknown`), or a stuck var
   inside an opaqueUnion/overload (`t:`) wrapper.
2. **Callers rebuild concretely** (they hold `sig`, `ctx`, the trial). For each stuck entry: read the
   param's TS type from `sig.parameters[i]`, then re-`classify` it with the stuck var symbols
   **temporarily deleted from `ctx.typeVars`** (siblings preserved) and `ctx.resolveBound = true`, under a
   `registryTrial` throw-guard. Must run INSIDE `buildMemberSig`'s `try`, before the `finally` at `:2525`
   deletes the member's vars. `buildFunctionIR` (`:2148`) gets a local throw-guard trial (emit-side
   reachability already drops the unreferenced generic pre-demote entry — verified — so no orphan
   rollback is needed; the guard is only for a mid-rebuild throw).
3. **Keying:** `keyOf(id, np, rb)` gains the boolean `rb` dimension (§4) — no-op when unset. `entryKey`
   reads `ctx.resolveBound`. `registerNamed` forces `rb=false` for `kind:'enum'`.
4. **Naming:** `recordNode` base appends the resolved bound under `ctx.resolveBound` (§4). Stamp
   `relinkRb` at `:4164`, read it at `:3338`, add the `resolve-bound` suffix in `publicAnchor` (`:255`).
5. **One shared helper** so function / method / static / ctor rebuild identically.

## §6 Rule #4 (`_demoteFailed`) — preserved by construction

A **return-only** stuck var must still flag the whole return (`:2490-2492`): resolving a return-only
bound lets the CALLER pick the type of a value the LIBRARY controls (`json<T extends string>():
Box<T>` → a concrete `{v:string}` would falsely promise a string field the library never guarantees).
The concrete rebuild gates strictly on `paramOnlyResolved` (`:2473` = subst keys **minus** `returnOnly`),
so a return-only var never gets concretized. Round-trip vars never enter `subst` at all (`typeParamMode`
→ `'var'`). A var appearing in a wrapper in BOTH a param and the return is round-trip → `'var'` → never
touched. Fixture pins each boundary.

## §7 Tests

Extend `test/golden/cases/constrained-type-param-bound/` (update its now-stale "#211 deferred" comments).
Each is a golden the design-review flagged as needed to pin a boundary:
- `boxParam<T extends string>(x: Box<T>)` → `(…wrapString) => unit`, new `wrapString = {v: string}`.
- `useRender`-shaped multi-var: `f<S extends Record<string,unknown>, E extends HTMLElement>(p: Wrap<S,E>)`
  → `{state: Dict.t<JSON.t>, el: Dom.element}` (positional multi-var naming).
- **nested** buried bound: `Box<T>` whose field is `Inner<T>` → `{v: {w: string}}` (recursion).
- **self-ref** wrapper: `Box<T>{ v:T, next?: Box<T> }` → `type rec` concrete (termination).
- **enum field** in the wrapper: `Box<T>{ v:T, kind: Flag }` where `Flag` is ALSO used generically
  elsewhere → exactly ONE `flag` enum, no `flag2` (the enum-no-tag rule).
- `boxRoundTrip<T>(x: Box<T>): Box<T>` → **stays `box<'a>`** (round-trip tripwire).
- return-only buried: `mk<T extends string>(): Box<T>` → `_demoteFailed`-flagged return (rule #4).
- both-positions buried: `f<T extends string>(x: Box<T>): Box<T>` → **stays `box<'a>`**.
- mixed multi-var: `f<T extends string, U>(x: Box<T>, y: U): U` → `x` concrete `{v:string}`, `U` stays `'a`.
- **union-wrapper unchanged (v1 scope):** `unionParam<T extends string>(x: Wrap<T> | Other)` → stays
  today's flagged `string` (the `t:` keyspace is out of scope; this golden guards against regressing it).
- `arrParam<T extends string>(x: T[])` → `array<string>` unchanged; unbounded buried → flagged.

Bench: base-ui `useRender` gains the shaped `Parameters` record (headline win); blend
`getSkeletonDefaults` (round-trips `T`) stays `('a, …) => 'a` — the regression tripwire.
`npm test`, `test:compile`, `bench` green; regenerate goldens + baselines, review the diff.

## §6b Deep-wrapper soundness (found in the code-review loop)

A wrapper nested **past `MAX_DEPTH`** whose inner types are ALSO registered generically by a round-trip
sibling (`deepParam<T extends string>(x: D1<T>)` alongside `d7RT<T>(x: D7<T>): D7<T>`) exposed a real
`'a` leak: the concrete rebuild's deep-boundary link resolved `entryKey` with a stale `resolveBound=false`
and **dedup'd into the generic twin** `id:N` instead of `id:N|rb`; the twin is a GHOST at rebuild time
(its `'a` is stamped later by the heal + `syncRefTparams` post-pass), so the per-var `collectStuckVars`
check couldn't see it → the concrete `|rb` record shipped `<'a>` (an `int` accepted where `T extends
string`). Two-part fix: (1) the `_heal` snapshot now captures `resolveBound`/`resolveBoundName` (§5);
(2) `rebuildStuckParam` runs a **reachability soundness gate** — reject (→ sound flagged `string`, the
#192 / no-sibling behaviour) any rebuild whose record-ref closure reaches a record that is NOT a `|rb`
entry AND is **generic at the source** (its instantiation carries a type-parameter arg). Checking the
SOURCE type (not the not-yet-stamped `tparams`) fires at ghost-time; a legit NON-generic shared record
(also keyed without `|rb`) is kept, so the shallow win survives. Pinned by the `D1..D8 + d7RT` golden.

## §8 Risks (design-review-informed)

- **Multi-keyspace corruption (the blocking review finding).** A read-dimension is NOT safe to
  blanket-thread through `keyOf` — enums (no `bySig`) would double-register `flag`/`flag2`, and the
  `t:` opaqueUnion/overload keyspace bypasses `keyOf` and would leak an unsound `wrap<'a>` accessor.
  Mitigated by §3's per-entry-kind policy (record/tagVariant tag; enum no-tag; `t:` out of v1 scope) and
  the enum-field + union-wrapper goldens.
- **`keyOf` must be a pure no-op when `rb` unset** — every existing entry keeps its exact key, so the
  whole change is byte-identical outside the stuck-param path. Verify via the untouched-golden diff.
- **Hidden reading sites** — `relinkRegistered`'s `:4164` mint / `:3338` read and `publicAnchor`'s
  reading suffix must both carry `rb`, or a truncated/­path-collided concrete entry mis-links to the
  generic. Explicit in §5 step 4; pinned by the nested + self-ref goldens.
- **Var lifecycle** — delete ONLY the stuck vars from `ctx.typeVars` (siblings preserved), inside
  `buildMemberSig`'s `try` before the `:2525` `finally`. Pinned by the mixed-multi-var golden.
- **Registry side effects during re-classify** — under a `registryTrial` throw-guard (SKILL). Emit-side
  reachability already drops the unreferenced generic pre-demote entry (verified), so no orphan rollback.
- **Checker-resolution churn** — do the rebuild in the demotion ACTION (past the decision), gated to the
  record/tagVariant stuck-param case, so non-candidates never trigger it (SKILL's reorder trap).
- **Determinism** — the key dimension is a boolean; correctness rests on `type.id` (source-fixed). The
  concrete NAME derives from the resolved bound positionally; a `typeArgAnchor` depth-cap (`'?'` past
  depth 2) collision only affects the cosmetic name (two deep bounds → same base → a counter), never
  correctness. No encounter-order counters (the #90/#141 trap).
- **Rule #4** — never concretize a `returnOnly` var; the rebuild gates on `paramOnlyResolved` (§6).
