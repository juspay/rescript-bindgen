# Changelog

All notable changes to `@juspay/rescript-bindgen` are documented here.
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

_Nothing yet._

## [1.1.0] — 2026-06-15

The "real-world packages" release: the generator now targets **general TypeScript
packages** (not just React), and a 50+ package benchmark drove the binding quality
of `@base-ui-components/react` from **14 → 195 / 195 usable components (0 review,
0 broken)** and unblocked Hono. Driven by community feedback on the
[announcement thread](https://forum.rescript-lang.org/t/introducing-juspay-rescript-bindgen/7210).
No breaking CLI changes; generated *output* is substantially more precise.

### Added
- **General TypeScript support — functions and classes, not just React** (#15).
  A package with no React components (Hono, utilities, SDKs) is no longer rejected
  with "No React components found": standalone functions emit `@module external`
  bindings, and classes emit a `@new` constructor + `@send` methods + `@get`
  accessors over an abstract instance type. Same `TS checker → IR → emit` pipeline.
- **Shared HTML attribute library + record-props emission** (#16, #18, #19). A
  component whose props extend `*HTMLAttributes` (bare, `Omit<…, K>`, `Partial`, or
  heritage `extends`) emits `type props = {...HtmlAttrs.<leaf>, <own>}` +
  `external make: React.component<props>` instead of inlining 70+ labeled attribute
  args. `HtmlAttrs.res` models React's attribute hierarchy (aria → events → globals
  → per-element) via record spread, generated from the exact-pinned `@types/react`
  devDependency (`npm run gen:attrs`). `--no-html-attrs` restores the legacy form.
- **Namespace member bindings + alias modules** (#25). base-ui's documented
  `<Accordion.Root>` idiom now works: namespace members bind through the namespace
  object (`@scope("Accordion") … = "Root"`) and each namespace gets a zero-cost
  alias module (`Accordion.res`: `module Root = AccordionRoot`).
- **`WebTypes.res` sink, `Promise<T>`, and chainable self-returns** (#24).
  Web-platform classes (`Request`, `Response`, `Headers`, `URL`, `AbortSignal`,
  `Blob`, streams, `WebSocket` — lib.dom-declared only) map to abstract types in a
  generated dependency-free module; `Promise<T>` → `promise<t>` (incl.
  `Promise<void>` → `promise<unit>`) and `T | Promise<T>` → `promise<t>`; methods
  returning a non-exported base class chain on the abstract `t` (Hono's
  `app.get(...).post(...)`). Library bases (`Date`, `EventTarget`) are never claimed.
- **Render-prop function form** (#46). `render?: ReactElement | ((props, state) =>
  ReactElement)` keeps the ergonomic `~render: React.element`, plus a zero-cost
  `external renderFn: ((props, state) => React.element) => React.element` wrapper —
  typed with the component's exact state record — for the function form. (An
  `@unboxed Element | Fn` cannot compile: `React.element` is abstract.)
- **Faithful overloads + open string-literal unions** (`LiteralUnion`). An
  overloaded function (intersection of call signatures) becomes an opaque module
  with one zero-cost `as*` accessor per signature (no overload dropped); a
  `'a' | 'b' | (string & {})` / `… | string` widening keeps its literals as an
  `@unboxed` enum + `Custom(string)` catch-all instead of collapsing to `string`.
- **Round-tripping collection generics** (#50). `Record<string, V> | Array<{label,
  value: any}>` (Select's `items`) → `@unboxed Dict(Dict.t<V>) | ItemsConfigArr(
  array<itemsConfig<'a>>)`, where a consumer-supplied `value: any` becomes a real
  generic threaded to the component.
- **Real-world benchmark gate + fixture guard** (#17). A one-click, environment-gated
  CI job regenerates bindings for 8 pinned real packages and diffs against committed
  baselines (compile + bucket metrics); a fixture guard blocks any `src/` mapping
  change that lacks a golden case or a `docs/TYPE_MAPPING.md` row.

### Changed
- **SCC-merged shared modules are named after their largest member** (#35): a cyclic
  type group is now e.g. `PositionerSharedTypes`, not the 40-char
  `ComponentsMenubarRootStoreToastTypes`. Short, and stable — adding/removing a small
  domain to the cycle no longer renames the module and breaks consumers' references.
- **Large string-literal runs collapse to one polyvar arm** (#53): a non-discriminable
  union with ~170 tag-name literals (React's `ElementType`) now emits one
  `external fromTag: [#"a" | #"div" | …] => t` instead of ~2 lines per literal —
  react-tooltip's `DistTypes.res` went 398 → 43 lines, same exactness.
- **`int` vs `float` heuristic narrowed** (#32): `step`/`min`/`max`/`width`/`size`/
  `offset`/`duration` now map to `float` (fractional values are legal, e.g.
  `Slider step={0.1}`); only provably-integral names (`count`, `index`, `tabIndex`, …)
  stay `int`.
- For components emitted as record-props (HTML-attrs), non-JSX direct
  `Module.make(...)` calls change shape (a record instead of labeled args); JSX call
  sites are unchanged and gain the full typed HTML/ARIA surface.

### Fixed
- **State-dependent props** `T | ((state) => T)` → zero-cost `@unboxed Style/Str | Fn`
  instead of a flagged `string` — flipped `@base-ui-components/react` from **14 → 151**
  usable components (#22). `@unboxed` dedup is now structural (two components sharing a
  prop name but differing in payload no longer collapse to the first's type).
- **Prop-position `any` → implicit component generics** (#31): an `any`-typed prop
  becomes a type variable (keyed by its carrying alias, so `value`/`defaultValue`/
  `onValueChange` unify) instead of a broken `string` — base-ui broken **16 → 0**.
- **DOM events + distributed eventDetails records** (#30): a DOM event value maps to
  `Dom.event`, and a union of instantiations of one generic record collapses to a
  single record — NumberField/Select/Slider/Accordion primary callbacks are now fully
  typed (`onValueChange: (float, …changeEventDetails) => unit`). Plus direct-callback
  param salvage: an unmodellable callback PARAM becomes a fresh type variable rather
  than collapsing the whole callback to `string` (a clean RETURN is required).
- **base-ui bindings were broken at runtime** (#25): the flat names (`AccordionRoot`)
  are `export type *` — type-only, `undefined` at runtime; values live on namespace
  objects. Now bound via `@scope` (see Added).
- **Deep all-string "ghost" records healed** (#33): a record first reached at the
  `MAX_DEPTH` boundary had its fields built past the budget → an all-`string` ghost; a
  post-extraction pass re-resolves it at depth 0 (accepting only when it pulls zero new
  entries, so unbounded library graphs stay truncated). Case-only-distinct enum members
  (`'a' | 'A'`) no longer emit two identically-named constructors (a compile error).
- **Unmodellable `@unboxed` fn params no longer fake a `string`** (#41): `{}` empty
  states → `JSON.t`; `File`/`FileList`/`FormData` without rescript-webapi → abstract
  `WebTypes` types; anything else unnameable → a fresh type variable.
- **Exact views for the last review patterns** (#39): `boolean | RefObject | fn` focus
  props → `@unboxed Bool | Ref | Fn`; `collisionBoundary`/`anchor` (incl. @floating-ui's
  `Rect`/`VirtualElement`) → opaque modules with `from*` constructors; `finalFocus`/
  `initialFocus` callback returns → construct-only `<Prop>Target` views. base-ui review
  **28 → 0**.
- **Fidelity polish** (#34): `number | null` value props → `Nullable.t<float>` (so a
  controlled component can be cleared); `Ref<HTMLInputElement>` →
  `React.ref<Nullable.t<Dom.htmlInputElement>>` (element specificity).
- **Bare `--pkg <name>` installs the `latest` dist-tag** instead of `*`, so
  prerelease-only packages (e.g. `@base-ui-components/react`) resolve (#23).


## [1.0.0] — 2026-06-04

First stable release.

### Added
- Deterministic TypeScript → ReScript binding generator driven by the TypeScript
  compiler API (no AI).
- `@react.component external make` emission with the type-checker resolving
  `Omit`/`Pick`/`Partial`, intersections, `RefAttributes`, imported enums, and
  indexed-access types into a flat prop list.
- Type mapping table: string-literal unions / enums → `@as` variants, events →
  `ReactEvent.*`, `ReactNode` → `React.element`, `CSSProperties` → `JsxDOM.style`,
  refs → `React.ref<Nullable.t<Dom.element>>`, `Record` → `Dict.t`, arrays, `Date`,
  and a `number` → `int`/`float` name heuristic.
- **Untagged (`@unboxed`) variants** for multi-type props (`string | number`,
  `string | string[]`, …) — type-safe and zero-cost, with the raw value reaching JS.
  No `%identity`, `@unwrap`, or `Obj.magic`.
- Human-review flagging: undiscriminable unions get a `string` placeholder, an inline
  `// ⚠️ REVIEW` comment, and a report entry — never an unsafe cast.
- Defect flagging: `unknown`/`any` props are reported as upstream type defects, never
  silently typed.
- `rescript-bindgen` — CLI for any typed React package (`--pkg`/`--file`/`--dir`),
  with version-pinned install of `--pkg name@version` into a scratch cache.
- `--report` flag → writes `_REPORT.md`: a component checklist (ready / loose /
  needs-review / broken) with the original TypeScript for each flagged prop.
- Library API (`extractComponent`, `extractModule`, `emit`, `report`) with TypeScript
  types in `types.d.ts`.
- `--compile` flag and a ReScript 12 sandbox to verify generated output builds.

### Verified
- Generates and compiles **71/71** components of
  `@juspay/blend-design-system@0.0.37-beta.4` on ReScript 12.
