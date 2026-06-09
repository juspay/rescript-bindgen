# @juspay/rescript-bindgen

> Deterministic **TypeScript → ReScript** binding generator. Reads `.d.ts` files
> through the TypeScript compiler API and emits type-safe
> `@react.component` bindings — **no AI, no `%identity`, no unsafe casts.**

Point it at **any** typed React component package — published on npm, a local folder, or a
single `.d.ts` — and get idiomatic, compile-ready ReScript bindings you'd otherwise hand-write
and hand-maintain.

---

## Why

There is one existing tool in this space, [`ts2ocaml`](https://github.com/ocsigen/ts2ocaml),
but it **cannot generate React component bindings** (it emits `external x: any` with a
`FIXME` for `ForwardRefExoticComponent`) and doesn't match a project's house style.

`rescript-bindgen` is purpose-built for **React component packages**: it resolves
`Omit<…>`, intersections, imported enums, `RefAttributes`, and indexed-access types
via the TypeScript **type-checker**, then emits idiomatic ReScript 12 bindings.

The generator is **deterministic**: identical input always produces identical output.
Anything it cannot bind in a fully type-safe way is **flagged for human review**, never
silently hacked.

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
npx rescript-bindgen --pkg react-day-picker --out generated
npx rescript-bindgen --pkg @mui/material@5.16.0 --only Button --out generated

# a single .d.ts file, printed to stdout
npx rescript-bindgen --file ./types/Foo.d.ts --stdout

# a local folder containing an index.d.ts
npx rescript-bindgen --dir ./node_modules/some-lib --out generated
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
npx rescript-bindgen --pkg @mui/material --out generated --report
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
npx rescript-bindgen --pkg @mui/material --out generated --report
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
