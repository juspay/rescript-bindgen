# Changelog

All notable changes to `@juspay/rescript-bindgen` are documented here.
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

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

### Fixed
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
