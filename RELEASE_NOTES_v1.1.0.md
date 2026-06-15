# rescript-bindgen v1.1.0 — the "real-world packages" release

`@juspay/rescript-bindgen` turns a TypeScript library's type definitions (`.d.ts`)
into **ReScript bindings** automatically — deterministically, with no AI at runtime.
It runs the TypeScript compiler to read the types, then prints idiomatic ReScript.

This release does two big things: it stops being React-only and now binds **general
TypeScript packages**, and — guided by the feedback on the
[announcement thread](https://forum.rescript-lang.org/t/introducing-juspay-rescript-bindgen/7210)
— it makes the *generated types far more precise* on real component libraries.

> **The headline number:** on `@base-ui-components/react` (195 components), output went
> from **14 usable** components to **195 / 195 usable — 0 needing review, 0 broken.**
> And Hono, which used to be rejected outright, now binds.

---

## A few terms used below

- **usable / review / broken** — every prop is bucketed. **usable** = mapped to an exact,
  safe ReScript type. **review** = we *refused* to emit a possibly-wrong type, so it's a
  `string` placeholder with a `// ⚠️ REVIEW` comment for a human. **broken** = the
  upstream type was `any` (genuinely untyped). The goal is everything **usable**, and
  *never* a plausible-but-wrong type — we **flag, don't fake**.
- **`@unboxed` variant** — ReScript's zero-runtime-cost tagged union. A prop like
  `string | number` becomes `Str(string) | Num(float)` that compiles to the raw value —
  no wrapper object, no unsafe cast.
- **opaque module / `from*` views** — for a type ReScript can't express directly, we emit
  an abstract type `t` plus zero-cost constructors (`Boundary.fromElement`,
  `Boundary.clippingAncestors`). The value passes straight through; you can build every
  valid case and nothing invalid.
- **`%identity`** — ReScript's zero-cost "this value is already the right shape" cast. We
  only ever use it inside the opaque-module pattern above — never as a blind `Obj.magic`.

---

## What's new

### 🚀 General TypeScript, not just React
A package with no React components (Hono, SDKs, utility libs) used to print
*"No React components found."* Now: standalone **functions** become `@module external`
bindings, and **classes** become a `@new` constructor + `@send` methods + `@get`
accessors over an abstract instance type — and fluent APIs that return `this`
(`app.get(...).post(...)`) chain correctly.

### 🧩 React attribute hierarchy, modelled once
Components that spread the standard HTML/ARIA attributes no longer inline 70+ labelled
args each. We generate **`HtmlAttrs.res`** — React's real attribute hierarchy (aria →
events → globals → per-element) as spread-able records, built from a pinned
`@types/react` — and emit `type props = {...HtmlAttrs.button, ...own}`. Your JSX is
unchanged and gains the full typed attribute surface.

### 🌳 Namespaces & the `<Accordion.Root>` idiom
base-ui exposes components as `Accordion.Root`, not `AccordionRoot` (the flat names are
type-only and **`undefined` at runtime** — bindings to them silently broke). We now bind
through the namespace object and emit zero-cost alias modules so `<Accordion.Root />`
works as documented.

### 🌐 Web-platform types & Promises
`Request`, `Response`, `Headers`, `URL`, `Blob`, streams, etc. map to abstract types in a
generated, dependency-free **`WebTypes.res`** (instead of `string` placeholders), and
`Promise<T>` becomes `promise<t>`. Hono's `fetch` now reads
`(~request: WebTypes.request) => promise<WebTypes.response>`.

### 🎨 Precise component props
Render props, refs, state-dependent `style`/`className`, focus props, collision
boundaries, anchors, `items` collections — all of base-ui's tricky props that used to
fall back to `string` now have exact types (`@unboxed` variants, typed refs, opaque-module
views, or honest generics). Controlled-value props accept `Nullable.t` so you can clear
them; refs carry their concrete element (`Dom.htmlInputElement`).

---

## Quality & process
- A **benchmark gate** regenerates bindings for 8 pinned real packages on every release
  candidate and diffs them against committed baselines (compile + metrics), so a mapping
  change can't silently regress the others.
- A **fixture guard** blocks any change to the generator that doesn't also update a golden
  test case or the `docs/TYPE_MAPPING.md` contract.

## Compatibility
No breaking CLI or library-API changes. Generated *output* is substantially more precise;
if you regenerate existing bindings you'll see better types (and, for HTML-attr
components, a record-shaped `make` for non-JSX call sites).

## Install
```bash
npm i -D @juspay/rescript-bindgen
npx @juspay/rescript-bindgen --pkg <package> --out generated --report
```

Full technical detail: [CHANGELOG](./CHANGELOG.md) · mapping contract:
[docs/TYPE_MAPPING.md](./docs/TYPE_MAPPING.md). Thanks to **@tsnobip** and
**@JohnsongDetlev** on the forum — Hono, the base-ui namespace handling, and the
render-prop/ref/collection precision in this release came directly from your testing.
