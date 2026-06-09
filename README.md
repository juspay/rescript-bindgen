# @juspay/rescript-bindgen

> **Turn any typed React/TypeScript package into idiomatic, type-safe ReScript bindings.**
> It reads `.d.ts` through the TypeScript compiler API and emits `@react.component` bindings —
> deterministically, with **no AI, no `%identity`, no unsafe casts.**

Point it at **anything typed** — a published npm package (any version), a local folder, or a single
`.d.ts` — and get compile-ready ReScript 12 bindings you'd otherwise hand-write and hand-maintain:

```bash
npx @juspay/rescript-bindgen --pkg @radix-ui/react-dialog --out generated --report
```

> **Scope today:** it targets **React component packages** — it binds `FC` / `forwardRef` /
> function-component exports. A non-React TypeScript library (e.g. a backend lib) prints
> `No React components found to generate`. Generating bindings for *any* TypeScript surface — plain functions,
> classes, type aliases — is the direction we're actively building toward.

## Highlights

- 🌍 **Works on real libraries.** Tested across **50+ of the most popular React packages** — MUI, Radix UI,
  Headless UI, Ariakit, react-day-picker, cmdk, vaul, … — where **~93% of components bind cleanly**.
- 🔒 **Type-safe & zero-cost.** Enums → `@as` variants, multi-type props → `@unboxed` untagged variants,
  refs/events/CSS → their exact ReScript types. The raw runtime value reaches JS untouched.
- 🎯 **Deterministic.** Same input → same output, every run. No model, no guessing.
- 🚩 **Honest.** Anything it can't bind type-safely is **flagged for review**, never silently faked.
- 📦 **Any source.** npm package · local folder · single `.d.ts` · `pkg.pr.new` preview URL.

---

## Why not hand-write them?

Hand-writing bindings for a real component library means hundreds of props across dozens of
components — tedious, error-prone, and stale the moment the library updates. The only other tool in
this space, [`ts2ocaml`](https://github.com/ocsigen/ts2ocaml), **can't generate React component
bindings** (it emits `external x: any` with a `FIXME` for `ForwardRefExoticComponent`).

`rescript-bindgen` is purpose-built for **React component packages**: it drives the TypeScript
**type-checker** to resolve `Omit<…>`, intersections, imported enums, `RefAttributes`, generics, and
indexed-access types, then emits idiomatic ReScript 12 — and you re-run it on every upstream bump.
Anything it can't bind in a fully type-safe way is **flagged for human review**, never silently hacked.

---

## What it produces

Given this `.d.ts`:

```ts
declare const Button: import('react').ForwardRefExoticComponent<{
  buttonType?: ButtonType;            // enum
  text?: string;
  width?: string | number;            // multi-type
  onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
} & Omit<ButtonHTMLAttributes<HTMLButtonElement>, "style" | "className">>;
export default Button;
```

it emits:

```rescript
type buttonType =
  | @as("primary") Primary
  | @as("secondary") Secondary

@unboxed type widthValue = Str(string) | Num(float)

@module("@acme/ui") @react.component
external make: (
  ~buttonType: buttonType=?,
  ~text: string=?,
  ~width: widthValue=?,
  ~onClick: ReactEvent.Mouse.t => unit=?,
  ~id: string=?,
  @as("aria-label") ~ariaLabel: string=?,
) => React.element = "Button"
```

`<Button width=Num(5.0) />` sends `width: 5` to JS; `<Button width=Str("100%") />`
sends `width: "100%"`. Type-safe **and** zero-cost — the `@unboxed` variant is erased
at runtime.

---

## Tested on real-world libraries

Run against **50+ of the most-used React / TypeScript packages** — **~9,700 of 10,400 components (93%)
bind type-safely**, with no unsafe casts. A sample:

| Library | Components | Bound clean |
|---|---|---|
| **Radix UI** (`react-dialog`, `react-dropdown-menu`, `react-select`, `themes`, …) | 170+ | **100%** |
| `@ariakit/react` | 138 | 130 |
| `@headlessui/react` | 63 | 59 |
| `@mui/material` | 133 | 86 |
| `react-aria-components` | 246 | 71 |
| `react-day-picker` · `cmdk` · `vaul` | 27 · 10 · 6 | **100%** |
| `sonner` · `react-hot-toast` · `react-toastify` | 1 · 3 · 6 | **100%** |
| `formik` · `@hello-pangea/dnd` · `react-window` | 4 · 3 · 2 | **100%** |
| `lucide-react` · `@phosphor-icons/react` | 5,876 · 3,044 | **100%** (icons) |

Generic-heavy chart libraries (recharts, victory, chart.js) and class/CJS-only components are the long
tail — and whatever can't be bound type-safely is **flagged for review, never faked**.

---

## Install

```bash
npm install -D @juspay/rescript-bindgen
# or run ad-hoc:
npx @juspay/rescript-bindgen --help
```

Requires Node ≥ 20. ReScript 12 is recommended for the generated output.

### Preview builds (test an unreleased change)

Every PR and push to `main` auto-publishes a commit-pinned preview via
[pkg.pr.new](https://pkg.pr.new) — so you can try a fix before it's released. Install the exact build
by SHA (the URL is also posted as a comment on each PR):

```bash
npm i -D https://pkg.pr.new/@juspay/rescript-bindgen@<sha>
npx rescript-bindgen --pkg <some-package> --out generated --report
```

Previews live on pkg.pr.new (not npm), are ephemeral, and never affect the `latest`/`beta` you get
from a normal `npm install`.

---

## Usage

### Generate bindings for any typed React package

The package spec is the exact one you'd give to `npm install` (`name`, `name@1.2.3`,
a beta, or a pkg.pr.new URL). It's installed into a scratch cache and read from there,
so output is reproducible and version-pinned.

```bash
# a published package (any version)
npx @juspay/rescript-bindgen --pkg react-day-picker --out generated
npx @juspay/rescript-bindgen --pkg @mui/material@7.0.0 --only Button --out generated

# a single .d.ts file, printed to stdout
npx @juspay/rescript-bindgen --file ./types/Foo.d.ts --stdout

# a local folder containing an index.d.ts
npx @juspay/rescript-bindgen --dir ./node_modules/some-lib --out generated
```

| Flag | Meaning |
|------|---------|
| `--pkg <name[@ver]>` | npm package (auto-installed to a scratch cache if absent) |
| `--file <path.d.ts>` | a single declaration file (one component) |
| `--dir <folder>` | a folder containing `index.d.ts` |
| `--out <dir>` | output directory (default `generated`) |
| `--only <Comp>` | generate just one component |
| `--report` | **also** write `_REPORT.md` — the ready / loose / review / defect summary |
| `--from <name>` | override the `@module(...)` import name |
| `--stdout` | print to stdout instead of writing files (single component) |
| `--webapi` | emit `Webapi.*` types for `File` / `FileList` / `FormData` |
| `--clean` | remove stale generated files in `--out` before writing |
| `--no-install` | don't auto-install a missing `--pkg` |

> Untyped JS packages produce only loose skeleton bindings — the tool is type-driven.

### Get the report

Add `--report` to also emit `_REPORT.md` next to the bindings — a checklist of which
components are ready, which props were widened to `string` (loose), which need human
review, and which are broken (`unknown`/`any`):

```bash
npx @juspay/rescript-bindgen --pkg @mui/material --out generated --report
```

---

## How it works

```
INPUT          RESOLVE         EXTRACT          MAP             EMIT            REPORT
.d.ts / pkg → locate types → TS type-checker → mapping table → ReScript 12 → _REPORT.md
                              → IR             (fixed table)   emitter        (--report)
```

1. **Resolve** (`resolve.mjs`) — find the declaration entry for a file / dir / npm package.
2. **Extract** (`extract.mjs`) — the TypeScript **type-checker** resolves `Omit`,
   intersections, `RefAttributes`, generics and indexed-access into a flat prop list (the IR).
3. **Map** (`extract.mjs` + `emit.mjs`) — each TS type maps to ReScript via a fixed table (below).
4. **Emit** (`emit.mjs`) — render the IR to ReScript 12: `@as` variants, `@unboxed`
   variants, records, and the `@module @react.component external make` binding.
5. **Report** (`report.mjs`) — with `--report`, write a per-component `_REPORT.md`
   bucketing props into ready / loose / review / defect.

---

## Type mapping

| TypeScript | ReScript |
|---|---|
| `string` / `boolean` | `string` / `bool` |
| `number` | `int` (count/size/index names) or `float` |
| string-literal union / `enum` | `@as` variant |
| `string \| number`, `string \| string[]` | **`@unboxed` untagged variant** (`Str \| Num \| StrArr`) |
| `ReactNode` / `ReactElement` | `React.element` |
| `ComponentType<P>` / `FC<P>` | `React.component<p>` |
| `React.CSSProperties` | `JsxDOM.style` |
| `MouseEvent` / `FocusEvent` / `ChangeEvent` / `KeyboardEvent` | `ReactEvent.Mouse.t` / `.Focus.t` / `.Form.t` / `.Keyboard.t` |
| `Ref<HTMLX>` | `React.ref<Nullable.t<Dom.element>>` |
| `X[]` / `Record<K,V>` | `array<X>` / `Dict.t<V>` |
| `Date` / `CSSObject['x']` | `Date.t` / `string` |
| `Omit` / `Pick` / `Partial` / intersection | resolved & flattened by the checker |
| `unknown` | `JSON.t` (opaque value you build/decode) |
| object \| `object[]`, multi-object union | **opaque-type module** (zero-cost `from*` constructors) |
| `any` | **flagged as defect — never silently typed** |
| undiscriminable union (object shapes) | **flagged for human review** |

> Full mapping reference: [`docs/TYPE_MAPPING.md`](docs/TYPE_MAPPING.md) — every case, each backed by a golden fixture.

### Multi-type props use untagged variants

For `string | number` style props the tool emits a ReScript 11+
[untagged variant](https://rescript-lang.org/docs/manual/v11.0.0/variant) — the
officially recommended, zero-cost way to bind a JS value that can be several types.
The raw value reaches JS, with **no `%identity`, `@unwrap`, or `Obj.magic`.**

When a union's members can't be told apart at runtime (e.g. two object shapes), the
tool refuses to guess: it emits a `string` placeholder with an inline
`// ⚠️ REVIEW` comment and lists it in the report.

---

## The report

Add `--report` to write `_REPORT.md` next to the bindings — a checklist of components:

- `[x]` **ready to use** — every prop bound type-safely
- `[~]` **needs human review** — a multi-type prop couldn't be auto-discriminated
- `[ ]` **broken** — has `unknown`/`any` props that won't work as typed (fix upstream)
- `(n loose)` — props widened to `string` (compile and work, just loosely typed)

This separates *what won't work* (defects) from *what needs a decision* (review) from
*what's done* (ready). Each flagged prop is listed with its original TypeScript.

```bash
npx @juspay/rescript-bindgen --pkg @mui/material --out generated --report
```

---

## Library API

```js
import { extractComponent, extractModule, emit, report } from '@juspay/rescript-bindgen'

const ir = extractComponent('node_modules/pkg/dist/Button.d.ts', { from: 'pkg' })
const code = emit(ir)              // ReScript source string
const { defects, review, loose } = report(ir)
```

Exports: `extractComponent`, `extractModule`, `emit`, `report`, `resolveInput`,
`writeReport`. Full type definitions ship in `types.d.ts`.

---

## Development

```bash
npm test                  # smoke test + golden snapshot suite
npm run test:compile      # compile every golden fixture on ReScript (asserts 0 warnings)
npm run gen -- --pkg <some-package> --out generated --report
```

Golden fixtures live in `test/golden/cases/` (self-contained `.d.ts` → expected `.res`); the
ReScript compile sandbox in `test/sandbox/` compile-checks generated output. The mapping contract
is documented in [`docs/TYPE_MAPPING.md`](docs/TYPE_MAPPING.md).

---

## License

MIT © Juspay Technologies
