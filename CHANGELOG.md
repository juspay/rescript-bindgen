# Changelog

All notable changes to `@juspay/rescript-bindgen` are documented here.
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

_Nothing yet._

## [1.2.5-beta.0] — 2026-06-19

A **beta** prerelease (npm `beta` dist-tag) with three more shape-collapse fidelity fixes for
`@juspay/blend-design-system@0.0.37-beta.5`. No CLI/API changes. Promotes to stable `1.2.5` on the
next Monday release.

### Fixed
- **Three array/object props still collapsed to bare `string`** (#79, follow-up to #77). Each is a
  distinct pattern, now bound to its faithful type:
  - `(keyof T)[]` → **`array<string>`** (was a flat `string`). `keyof T` is an index type with no
    `classify` handler, so the whole prop went opaque; a key is a string at runtime, so an index type
    now maps to `string` and the array survives. (`DataTable.columnManagerAlwaysSelected`)
  - `React.ComponentProps<'div'>` / `DetailedHTMLProps<HTMLAttributes<…>, …>` → **`JsxDOM.domProps`**
    (was `string`). The all-DOM-attrs escape only matched `HTMLAttributes` on the inner name; now the
    `DetailedHTMLProps` / `ComponentProps` / `ComponentPropsWith(out)Ref` wrappers are recognized.
    (`StatCardV2NoData.filteredProps`)
  - `Rec | Rec[]` where the object arm is an **intersection** (`A & {…}`) → an **opaque module**
    (`fromRec` / `fromRecs`), was `string`. An intersection has no own `getSymbol()`, so it was dropped
    from the union's structured arms; it's now counted by its properties. (`TextInputV2.dropdown`)

  Blast radius audited — zero regressions: base-ui byte-identical (the structured-arm change is gated to
  intersections, so `number | Partial<{…}>` stays loose, not review); other 6 benchmark packages
  unchanged; the full beta.5 output compiles (0 broken, 0 review, 209/209 usable). Fixture:
  `shape-collapse`.

## [1.2.4] — 2026-06-18

A fidelity fix for single-array-of-mixed-union props. No CLI/API changes.

### Fixed
- **A single `(A | B | C)[]` array of a mixed enum/record union regressed to `string`** (#65 follow-up).
  When a library simplifies `A[] | B[] | C[] | (A|B|C)[]` to just `(A|B|C)[]` (blend did this to
  DateRangePicker's `PresetsConfig`), 1.2.3 emitted `~customPresets: string` instead of the faithful
  `array<…PresetsConfig.t>` opaque module. The single-array form took a different path than the
  union-of-arrays form and got stuck in `unionNode`'s `isStructured` gate (its record arms are
  `type X = {…}` aliases → `__type` symbol). Now the array branch binds an element union with ≥2
  object/array arms via `opaqueUnion` directly, named after the array's alias — so both forms produce
  the **identical** binding. Also upgrades `DataTable.columns` (`ColumnDefinition<T>[]`: `string` →
  faithful module) and similar array-of-union props (MultiSelect / SingleSelect / Skeleton / Timeline /
  Upload). Fixture: `union-of-arrays` (`presetsSingle`).

## [1.2.3] — 2026-06-18

A fidelity fix for deep SVG-path-data props. No CLI/API changes.

### Fixed
- **A deep `string | <tagged-tuple array>` was truncated to `array<JSON.t>`** (#72). A union whose arms
  are tagged tuples (`[string-literal head, …number]`) and/or `Array<literal>` — Highcharts'
  `SVGAttributes.d` (`string | SVGPathArray`) — is a *provably-bounded* leaf (literals + numbers, no
  nested records), so it's now modelled even past `MAX_DEPTH` (the depth bound only truncates *unbounded*
  record graphs). The deep `d` now binds as the faithful opaque module —
  `@unboxed Str(string) | Arr(array<D.t>)` with `D.fromSVGPathCommands` / `D.fromTupleN` `%identity`
  views — instead of `array<JSON.t>`. Verified: the full generated blend output compiles (408 modules).
  Letting this bounded shape build also lets the richer Highcharts records (e.g. `SVGAttributes` fields)
  win structural dedup over their depth-truncated all-`string` copies. Fixture: `svg-path-array`.

## [1.2.2] — 2026-06-18

More fidelity fixes found validating against `@juspay/blend-design-system@0.0.37-beta.x`. No CLI/API
changes — types that previously mis-mapped now map correctly (a one-time regeneration diff on those props).

### Fixed
- **`bigint` mis-mapped to `string`** (#70). `bigint` (and a `bigint` literal) now → ReScript `bigint`,
  and `string | number | bigint` → a faithful 3-arm `@unboxed Str(string) | Num(float) | Big(bigint)`
  (each arm a distinct JS `typeof`) instead of silently collapsing to bare `string`. Fixture: `bigint`.
- **A `scalar | <array>` union collapsing to a bare scalar** (#72). An array arm whose element can't be
  modelled now keeps the array and types the element as `JSON.t` (`array<JSON.t>`) — never a faked
  `array<string>`, never a dropped arm. Fixture: `string-opaque-array`.
- **Self-recursive unions unrolling into a monster** (#72). `type ClassValue = string | number |
  ClassValue[]` (clsx) now binds as a single `@unboxed Str(string) | Num(float) | Arr(array<JSON.t>)`,
  not a per-`MAX_DEPTH` nested type. Fixture: `recursive-union`.
- **Tagged-tuple arrays modelled faithfully** (#72). A union whose arms are tagged tuples
  (`[string-literal head, …number]`) and/or `Array<literal>` — SVG path data (`string | SVGPathArray`) —
  binds as an opaque module with one zero-cost `%identity` view per arm (`fromTupleN` / `fromCmds`),
  each arm's exact flat shape preserved (not a runtime-wrong `(cmd, array<float>)` nested tuple).
  Construct-only; gated to a string-literal tuple head (plain numeric tuples untouched). Fires for
  shallow occurrences; a deep one past `MAX_DEPTH` stays the honest `array<JSON.t>`. Fixture: `svg-path-array`.

## [1.2.1] — 2026-06-18

A small fidelity fix found while validating generated bindings against
`@juspay/blend-design-system`. No CLI/API changes — the affected props are now correctly shaped
(a one-time regeneration diff limited to those props).

### Fixed
- **Union-of-arrays props emitted as a `{ ...JsxDOM.domProps }` record** (#65). A prop whose type is
  a union whose every arm is an array — `DateRangePreset[] | CustomPresetConfig[] |
  CustomPresetDefinition[] | (DateRangePreset | CustomPresetConfig | CustomPresetDefinition)[]`
  (DateRangePicker's `customPresets`) — collapsed to a bogus record built from `Array`'s lib.es
  prototype methods (all inherited → the domProps catch-all), losing the `array<>` shape entirely.
  Every arm shares the global `Array` symbol, so the "same-generic-record" union collapse (added for
  `BaseUIChangeEventDetails<R>`) wrongly matched; array instantiations are now excluded from it. The
  prop binds correctly as `array<…>` of the element union — here an opaque module with zero-cost
  `from*` views (`array<DateRangePickerTypes.PresetsConfig.t>`), since the element is multiple object
  shapes that can't be `@unboxed`-discriminated. Also fixes the same latent bug in base-ui's
  `filteredItems`/`items`. Follow-up #68 tracks closing the broader builtin-container class
  (`Map<A> | Map<B>`, `Set`, `Promise`, …) in one place.

## [1.2.0] — 2026-06-17

The "fidelity" release, driven by exhaustively validating generated bindings against
`@juspay/blend-design-system@0.0.37-beta.6` (a per-component review of all 212 components,
across several rounds). It fixes an **uncompilable-output** bug, **reorganizes shared types
per component**, and resolves **~16 silent fidelity defects** (bindings that compiled but
mis-typed a prop). No CLI/API changes. Generated *output* is more correct and more faithfully
shaped — but module and anonymous-type **names differ from 1.1.0**, so a regeneration will
produce a sizable (one-time) diff.

### Fixed
- **Uncompilable output from recursive type groups** (#61). A parameterized type referenced
  before it acquired its type argument (e.g. `option<annotation>` where `annotation<'a>`) emitted
  uncompilable ReScript. A post-extraction fixpoint pass propagates type parameters across the
  group and re-syncs every reference, so no constructor is left under-applied.
- **Generated type names never shadow a pervasive** (#61). An upstream interface named `Array`/
  `Option`/… (→ `array`/`option`) is suffixed (`array2`) so it can't shadow the builtin.
- **`key` / `ref` stripped from nested data records** (#63). They're React-reserved only on a
  component's top-level props; a nested data record (Highcharts `colors: { key; color }[]`) keeps
  them.
- **Discriminated-union props dropped** (#63). `Base & (A | B | C)` kept only the props common to
  all arms (`Card`/`Badge`/`SelectItemV2` were unusable) — all arms' props are now emitted, with
  arm-specific ones optional.
- **First-party fields swallowed by the `...JsxDOM.domProps` spread** (#63). Own fields whose names
  collide with DOM attributes (`id`/`size`/`shape`) keep their real types (`AvatarData.id`).
- **Multi-arg / tuple-returning functions bound as `@react.component`** (#63). They now bind as
  functions, so dropped arguments (`renderVariantFallbackValue`'s 2nd arg) are restored.
- **`React.Context<T>` faked as a component** (#63). Binds as the context value `React.Context.t<T>`.
- **Nullability / optionality flips** (#63, #64, #65). `T | null` → `Nullable.t<T>` for any single
  type **and** multi-type unions (`number | string | null`), including callback params/returns;
  `| undefined` (and indexed access into an optional first-party prop) → optional; required props
  (`TimelineHeader.title`, `ResponsiveText.fontSize`, …) are no longer flipped optional; merged-prop
  optionality is taken from the first-party signature (`UnitInput.value`).
- **Numeric enums emitted as string tags** (#63). `enum { vertical = 0 }` → `@as(0)`, not `@as("0")`.
- **Deep self-references truncated to `string`** (#63). A direct self-reference resolves past the
  depth bound (`SingleSelectV2ItemType.subMenu` is recursive), while the bound still protects the
  unbounded Highcharts graph.
- **Global `Error` → unflagged `string`** (#63). Now the stdlib `JsError.t`.
- **Intersection-of-array types built a bogus record** (#63). `Item[] & Array<Item & {…}>`
  (`NestedSelectDrawer.items`) is now `array<…>`, not a `{ ...JsxDOM.domProps }` record.
- **Depth-truncated token ghosts** (#63). An all-`string` ghost is healed from a structurally-richer
  same-module twin (`MenuV2` color tokens).
- **Single-signature functions mis-modelled as overloads** (#65). A function that is one first-party
  signature plus an inherited one (or an optional-param expansion) — `Button.onClick` — is a plain
  callback (`option<…> => unit`), not an opaque overload module; genuine overloads are unaffected.

### Added
- **Fixed-arity TS tuples → ReScript tuples** (#65). `[number, number]` → `(float, float)`,
  `[string, number]` → `(string, float)`. Variadic/optional-element/1-tuples stay the flagged
  `string` fallback (ReScript tuples are fixed-arity).

### Changed
- **Shared types are organized per home module** (#61). Anonymous-record structural dedup is scoped
  per component, so types live in the module the library declares them in instead of fusing dozens
  of unrelated components into one giant catch-all (`HighchartsSharedTypes` held 2409/2578 types for
  blend). Only genuine mutual recursion now merges into a `*SharedTypes` module.
- **Descriptive, version-stable anonymous-record names** (#63). An anonymous `{…}` is named
  `<home><Prop>Config` (e.g. `avatarSizeConfig`) instead of a globally-numbered `<prop>Config`
  (`smConfig19`), so names say which component they belong to and unrelated upstream changes no
  longer renumber them.

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
