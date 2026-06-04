# @juspay/rescript-bindgen

> Deterministic **TypeScript → ReScript** binding generator. Reads `.d.ts` files
> through the TypeScript compiler API and emits type-safe
> `@react.component` bindings — **no AI, no `%identity`, no unsafe casts.**

Built to keep [`@juspay/rescript-blend`](https://github.com/juspay/blend-rescript)
in sync with [`@juspay/blend-design-system`](https://www.npmjs.com/package/@juspay/blend-design-system)
without hand-maintaining bindings — but it works on any typed React component package.

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

@module("@juspay/blend-design-system") @react.component
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
INPUT          RESOLVE         EXTRACT          MAP             EMIT            VERIFY
.d.ts / pkg → locate types → TS type-checker → mapping table → ReScript 12 → rescript build
                              → IR              (config-driven) emitter         + report
```

1. **Resolve** — find the declaration entry for a file / dir / npm package.
2. **Extract** — the TypeScript **type-checker** resolves `Omit`, intersections,
   `RefAttributes`, generics and indexed-access into a flat prop list (the IR).
3. **Map** — each TS type maps to ReScript via a fixed table (below).
4. **Emit** — render the IR to ReScript 12 (`@as` variants, `@unboxed` variants,
   nested sub-component modules, records, the `external make`).
5. **Verify** — optional `rescript build`, plus a per-prop report.

---

## Type mapping

| TypeScript | ReScript |
|---|---|
| `string` / `boolean` | `string` / `bool` |
| `number` | `int` (count/size/index names) or `float` |
| string-literal union / `enum` | `@as` variant |
| `string \| number`, `string \| string[]` | **`@unboxed` untagged variant** (`Str \| Num \| StrArr`) |
| `ReactNode` / `ReactElement` | `React.element` |
| `React.CSSProperties` | `JsxDOM.style` |
| `MouseEvent` / `FocusEvent` / `ChangeEvent` / `KeyboardEvent` | `ReactEvent.Mouse.t` / `.Focus.t` / `.Form.t` / `.Keyboard.t` |
| `Ref<HTMLX>` | `React.ref<Nullable.t<Dom.element>>` |
| `X[]` / `Record<K,V>` | `array<X>` / `Dict.t<V>` |
| `Date` / `CSSObject['x']` | `Date.t` / `string` |
| `Omit` / `Pick` / `Partial` / intersection | resolved & flattened by the checker |
| `unknown` / `any` | **flagged as defect — never typed** |
| undiscriminable union (object shapes) | **flagged for human review** |

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

Every run writes `_REPORT.md` — a checklist of components:

- `[x]` **ready to use** — every prop bound type-safely
- `[~]` **needs human review** — a multi-type prop couldn't be auto-discriminated
- `[ ]` **broken** — has `unknown`/`any` props that won't work as typed (fix upstream)
- `(n loose)` — props widened to `string` (compile and work, just loosely typed)

This separates *what won't work* (defects) from *what needs a decision* (review) from
*what's done* (ready).

---

## Library API

```js
import { extractComponent, extractModule, emit, report } from '@juspay/rescript-bindgen'

const ir = extractComponent('node_modules/pkg/dist/Button.d.ts', { from: 'pkg' })
const code = emit(ir)              // ReScript source string
const { defects, review, loose } = report(ir)
```

Types are shipped in `types.d.ts`.

---

## Limitations

- **Generic components** (`<T extends …>`) — generic type parameters resolve to
  `unknown` and are flagged as defects (e.g. blend's `DataTable`). Needs concrete
  types upstream or generic-binding support (planned).
- **Sub-components** (`Drawer.Title`) — detected in the IR; nested-module emission is
  planned.
- **Untyped JS** — produces loose skeleton bindings only (no types to read).
- `int` vs `float` for `number` is a name heuristic — verify numeric props if exact.

---

## Development

```bash
npm test                # self-contained smoke test
npm run gen -- --pkg <some-package> --out generated --report
node test/ts-demo.mjs   # live TypeScript compiler-API walkthrough (see test/DEMOS.md)
```

The ReScript compile sandbox lives in `test/sandbox/` (used to compile-check
generated output during development).

---

## License

MIT © Juspay Technologies
