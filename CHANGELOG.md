# Changelog

All notable changes to `@juspay/rescript-bindgen` are documented here.
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Changed
- **Large string-literal runs in opaque modules collapse to one polyvar arm** (#53):
  a non-discriminable union whose literal members are a big set (React's
  `ElementType`/`keyof JSX.IntrinsicElements` -> ~170 tag names, e.g.
  react-tooltip's `wrapper`) now emits `external fromTag: [#"a" | #"div" | …] => t`
  instead of one `external`+`let` pair per literal. Same exactness (the polyvar
  admits exactly that set, leak-free) — react-tooltip `DistTypes.res` 398 -> 43
  lines. A small literal set (< 4) keeps readable named constants.

### Added
- **Self-returning chained methods** via non-exported first-party base classes
  (hono's `get/post/…` returning `HonoBase<…>`) now map to the chainable `t`
  instead of minting numbered opaque types; library bases (`Date`, `EventTarget`)
  are never claimed (#24).
- **`WebTypes.res` sink for web-platform classes** (#24): `Request`, `Response`,
  `Headers`, `URL`, `AbortSignal`, `Blob`, streams, `WebSocket` (lib.dom-declared
  only) map to abstract types in a generated dependency-free module instead of
  flagged `string` placeholders — hono's `fetch` becomes
  `(t, ~request: WebTypes.request, …) => promise<WebTypes.response>`.
- **`Promise<T>` → `promise<t>`** (incl. `Promise<void>` → `promise<unit>`), and
  the sync-or-async value shape `T | Promise<T>` → `promise<t>` (#24).

### Added
- **Exact views for the formerly-review union patterns** (#39): base-ui review
  13 → 1. Four cooperating mechanisms: (1) VENDOR-record trial — dependency-
  declared consumer-constructed shapes (@floating-ui `Rect`/`VirtualElement`)
  extract as exact records iff every field is perfect (sandboxed + rolled back
  otherwise); (2) string-literal arms in views modules become ready-made
  constants via single-value polyvar casts (`Boundary.clippingAncestors`);
  (3) consumer-produced callback-RETURN unions become construct-only
  `<Prop>Target` views modules (`FinalFocusTarget.fromBool/fromHTMLElement/
  none`) — unlocking `finalFocus`/`initialFocus` as exact @unboxed and the
  `anchor` fn arm; (4) views-module members are now DEEP-checked for inner
  imperfections (an unflagged `=> string` fake can no longer hide inside a
  view). `isDomNodeType` is lib.dom-guarded (a vendor type merely named
  *Element no longer collapses into `Dom.element`). `DOMRectList` joined the
  WebTypes sink. Review hardening: construct-only views are gated to produce-positions (callback params keep the `'a` salvage), ident-colliding/`__type` arms reject the module instead of silently dropping a variant, reserved-word literal constants use the shared reserved set (note matches code), and a failed vendor-record trial fully rolls back minted names + type vars.
- **Render-prop function form bindable via zero-cost wrapper** (#46): a
  `render?: ReactElement | ((props, state) => ReactElement)` prop stays
  `React.element` (the common case is unchanged), and the component module now
  also carries `external renderFn: ((props, state) => React.element) =>
  React.element = "%identity"` — typed with the signature's EXACT extracted
  types (the real per-component state record). `render={renderFn((p, s) => …)}`
  binds the function form; 177 base-ui components gain it. An @unboxed
  `Element | Fn` cannot compile (React.element is abstract) — this wrapper is
  the type-safe alternative, now an explicitly allowed %identity form in the
  contract (CLAUDE.md + golden-suite guard updated).
- **Direct-callback param salvage** (#30, probe I-1a): a callback prop whose
  RETURN is clean but whose PARAM can't be modelled now keeps a usable typed
  callback with a fresh type variable for the bad param (`('a, string) => unit`)
  instead of collapsing the whole prop to a `string` placeholder — params flow
  library->consumer, so an annotate-at-call-site hole is honest. A bad RETURN is
  still NOT salvaged (it would feed wrong values into the library). Completes the
  I-1a mechanism (the @unboxed-union case shipped in #41).
- **Fidelity polish trio** (#34, probe I-5/I-7/I-8): `number | null` value props
  -> `Nullable.t<float>` (passing null = controlled-clear, recovered from the
  syntactic node since strictNullChecks is off); a `render` prop's dropped
  function form now carries an ⓘ note instead of vanishing silently; `Ref<T>`
  with a concrete element arg -> `React.ref<Nullable.t<Dom.htmlInputElement>>`
  (specificity) instead of the generic `Dom.element`.

### Changed
- **SCC-merged shared modules are named after their largest member** (#35,
  probe I-9): a cyclic type group now becomes e.g. `PositionerSharedTypes`
  instead of the 40-char `ComponentsMenubarRootStoreToastTypes` (every member
  concatenated). Shorter, and STABLE — adding/removing a small domain to the
  cycle no longer renames the module and breaks consumers' qualified refs.

### Fixed
- **Degraded all-string ghost records healed** (#33, probe I-4): a record first
  reached at the MAX_DEPTH boundary registered but had its fields built past the
  budget -> an all-`string` ghost (`setOpenConfig2` with `cancel: string`). A
  post-extraction pass re-resolves mostly-fallback records at depth 0, accepting
  the result only when it adds zero new registry entries — genuine small configs
  heal (`cancel: unit => unit`) while unbounded library graphs (Highcharts) are
  rolled back and stay safely truncated.
- **Case-only-distinct enum members de-collided** (#33): `'a' | 'A'` no longer
  emit two constructors named `A` (a compile error); later collisions get a
  numeric suffix (`A` / `A2`), the `@as` arm keeping the runtime value.
- **Unflagged param fakes inside `@unboxed` Fn members** (#41, shipped since #22):
  a fn param that failed to classify silently rendered as `string` inside shared
  variants. Three-rung most-specific-type ladder now: `{}` empty states ->
  `JSON.t`; `File`/`FileList`/`FormData` without rescript-webapi -> abstract
  `WebTypes` sink types (full `Webapi.*` still preferred when installed);
  anything else unnameable -> a fresh type variable (`Fn('x => …)`).
- **base-ui review remainders** (#39): `boolean | RefObject | fn` focus props ->
  `@unboxed Bool | Ref | Fn`; `HTMLElement | ShadowRoot | RefObject` containers ->
  opaque modules with `from*` views (`ShadowRoot` -> `Dom.shadowRoot`);
  `Intl.LocalesArgument` -> `string` + note. base-ui review 28 -> 9, usable
  167 -> 186 (95%).
- **Prop-position `any` -> implicit component generics** (#31, probe I-2): an
  `any`-typed prop becomes a type variable (keyed by its carrying alias, so
  `value`/`defaultValue`/`onValueChange` over one alias unify) instead of a
  broken `string` placeholder — base-ui broken components 16 -> 0, usable
  151 -> 167. Shared-record fields keep the flagged defect.
- **DOM-event values and distributed eventDetails records** (#30, probe I-1/I-6):
  a DOM event as a VALUE (solo or union — base-ui's distributed
  `ReasonToEvent<R>`) maps to `Dom.event`, and a union of instantiations of
  the SAME generic record collapses to one record over its apparent members —
  NumberField/Select/Slider/Accordion primary callbacks are now fully typed
  (`onValueChange: (float, …changeEventDetails) => unit`) instead of loose
  `string` placeholders; base-ui loose count 27 → 16.
- **base-ui bindings were broken at runtime** (#25): the flat names
  (`AccordionRoot`) are `export type *` — type-only, `undefined` at runtime; the
  values live on namespace objects (`Accordion.Root`). Components reachable as
  namespace members now bind `@scope("Accordion") … = "Root"`, and each namespace
  gets a zero-cost alias module (`Accordion.res`: `module Root = AccordionRoot`)
  enabling the documented `<Accordion.Root>` JSX idiom.
- Bare `--pkg <name>` now installs the `latest` dist-tag instead of the `*`
  range — npm's `*` excludes prereleases, so packages publishing only
  prereleases (e.g. `@base-ui-components/react`) failed to resolve (#23).
- **State-dependent props** (`T | ((state: S) => T)`, incl. the checker-resolved
  `T | (T & ((state: S) => T))` intersection form) now map to zero-cost
  `@unboxed Style/Str | Fn` variants instead of flagged `string` placeholders —
  flips `@base-ui-components/react` from 14 to 151 usable components (#22).
- `@unboxed` union dedup is now **structural**: two components sharing a prop
  name but differing in payload (per-component state records) no longer silently
  dedupe to the first component's type; function-bearing unions over one record
  are named after it (`accordionRootStyle`) (#22).

### Added
- **Shared HTML attribute records + record-props emission** (#16, #18, #19). A
  component whose props extend `*HTMLAttributes` (bare, `Omit<…, K>`, `Partial`,
  or heritage `extends`) now emits `type props = {...HtmlAttrs.<leaf>, <own>}` +
  `external make: React.component<props>` instead of inlining 70+ labeled
  attribute args. `HtmlAttrs.res` models React's hierarchy (aria → events →
  globals → per-element) with record type spread, generated from the exact-pinned
  `@types/react` devDependency (`npm run gen:attrs` regenerates on a pin bump).
  TS `Omit` and own-prop collisions narrow only the affected slice (deduped
  variants). `--no-html-attrs` restores the legacy inlined output.

### Changed
- Consumers of generated bindings for such components: JSX call sites are
  unchanged and gain the full typed HTML/ARIA attribute surface; non-JSX direct
  `Module.make(...)` calls change shape (record instead of labeled args).

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
