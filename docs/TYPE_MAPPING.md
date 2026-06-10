# TypeScript → ReScript mapping reference

> **The bible.** This is the canonical, executable contract for how
> `@juspay/rescript-bindgen` turns a TypeScript `.d.ts` into ReScript bindings.
> Every rule below is backed by a fixture in [`test/golden/cases/`](../test/golden/cases)
> whose committed output is diffed **and** compiled in CI. If you change a mapping,
> you change a row here, a fixture, and its golden — together. See [Maintenance](#maintenance).

## The contract (read this first)

**Goal: maximum ReScript fidelity.** `%identity` is not something to avoid — used inside an
opaque module it is a principled, zero-cost tool (the value passes straight through unchanged),
exactly as hand-written official bindings use it. Prefer fidelity over a `string` placeholder.
The **fidelity ladder**, best first:

1. an **exact** native ReScript type;
2. an [`@unboxed`](#unboxed-unions) untagged variant when members are runtime-discriminable;
3. an [**opaque-type module**](#opaque-module-unions) with zero-cost `%identity` views — forward
   `from*` constructors (concrete→opaque) and/or reverse `as*` accessors (opaque→concrete, e.g. the
   per-signature views of an overloaded function) — when `@unboxed` can't express it;
4. only then a `string` placeholder + a bucket flag (⚪ loose / 🔍 review / 🛑 broken).

The rules:

1. **No unsafe casts.** Never `Obj.magic`, `@unwrap`, or a *bare* `%identity`. The *only* permitted
   `%identity` is the zero-cost `external from*` constructor **or `as*` accessor** of an
   [opaque-type module](#opaque-module-unions), where the value genuinely passes through unchanged.
2. **Flag, don't fake.** If a type can't reach rung 1–3, emit a `string` placeholder with a comment
   and bucket it (⚪ loose / 🔍 review / 🛑 broken) — never a plausible-but-wrong type.
3. **Multi-type props** become an [`@unboxed`](#unboxed-unions) untagged variant when the members
   have distinct runtime tags (`typeof`/`Array.isArray`), else an [opaque module](#opaque-module-unions).
4. **`unknown` is an opaque value → `JSON.t`**, never a type variable (a type variable in
   callback position is unsound). A type variable `'a` is reserved for a genuine generic that
   round-trips. See [Generics](#generics--erased-generics).

The report buckets a prop by the *worst* imperfection in its type tree:

| Bucket | Meaning | Emitted as |
|---|---|---|
| ✅ exact | maps precisely | the real ReScript type |
| ⚪ loose | a real but complex type widened | `string` + `// ⚪ loose — was …` |
| 🔍 review | a multi-type prop we refuse to bind unsafely | `string` + `// ⚠️ REVIEW` |
| 🛑 broken | resolved to `any` (untyped) | `string` + `// 🛑 BROKEN` |

---

## Primitives & opaque values
Fixture: [`primitives`](../test/golden/cases/primitives)

| TypeScript | ReScript | Notes |
|---|---|---|
| `string` | `string` | |
| `number` | `int` *or* `float` | name heuristic: count-like names (`count`, `width`, `index`, `size`, `length`, `tabIndex`, …) → `int`; else `float` |
| `boolean` | `bool` | |
| `unknown` | `JSON.t` | opaque value you build/decode — **not** a defect, **not** a type variable |
| `any` | 🛑 `string` | genuinely untyped → flagged broken |
| `Date` | `Date.t` | |
| `T[]` / `Array<T>` | `array<…>` | element classified recursively |
| `Record<string, V>` | `Dict.t<…>` | `Record<string, unknown>` → `Dict.t<JSON.t>`; `Record<string, string>` → `Dict.t<string>` |
| `Map<K, V>` / `ReadonlyMap` / `WeakMap` | `Map.t<k, v>` | detected on the resolved symbol, so a first-party alias (`type EventHandlerMap = Map<…>`) is caught too — never a `{...JsxDOM.domProps}` record ([`builtin-map-set`](../test/golden/cases/builtin-map-set)) |
| `Set<T>` / `ReadonlySet` / `WeakSet` | `Set.t<t>` | as above |

---

## String-literal unions & enums
Fixtures: [`string-enums`](../test/golden/cases/string-enums), [`literal-union-open`](../test/golden/cases/literal-union-open)

| TypeScript | ReScript |
|---|---|
| `'sm' \| 'md' \| 'lg'` | `type size = \| @as("sm") Sm \| @as("md") Md \| @as("lg") Lg` |
| `'a' \| 'b' \| (string & {})` | a plain enum — the `string & {}` "open" escape is dropped (this is the `HTMLInputTypeAttribute` shape) |
| `'a' \| 'b' \| string` (plain `\| string` widening) | `@unboxed type <base>OrString = \| @as("a") A \| @as("b") B \| Custom(string)` — the literals as `@as` arms + a `Custom(string)` catch-all. Zero-cost, typo-safe on the known values, still accepts any other string. (TS collapses the union to bare `string`, so the literals are recovered from the **syntactic** node — component-prop level only for now.) |
| real `enum` | same `@as` variant form |

Constructors are PascalCased from the literal (`"icon-only"` → `IconOnly`, `"2xl"` → `V2xl`). A
prop literally named `type` becomes `@as("type") ~type_` (reserved-word escaping). The open
`<base>OrString` form is named to match the `boolOrString` / `stringOrNumber` convention, leaving the
bare name free for a co-occurring **pure** (closed) enum of the same literals.

> **`(string & {})` vs `\| string` — both keep the literals, differently.** The branded `(string & {})`
> form preserves its literals at the type level (TS does *not* collapse it) → a **closed** enum. The
> plain `\| string` form *is* collapsed by TS to `string`, so the literals are recovered from the
> syntactic union node → an **open** `@unboxed` variant with a `Custom(string)` catch-all. Caveat: a
> `\| string` may be a *genuine* escape hatch or merely *loose typing* (only the literals actually work
> at runtime) — a runtime question the type-only tool can't answer, so the catch-all (a strict superset
> of `string`) is the safe default; humans tighten to a closed enum when the runtime confirms it.

---

## `@unboxed` unions
Fixture: [`unboxed-unions`](../test/golden/cases/unboxed-unions)

A union whose members have **distinct runtime types** becomes a zero-cost `@unboxed` untagged
variant (discriminated at runtime). **At most one member may be an object type.**

| TypeScript | ReScript |
|---|---|
| `string \| number` | `@unboxed type stringOrNumber = Str(string) \| Num(float)` |
| `string \| string[]` | `@unboxed type stringOrStringArray = Str(string) \| StrArr(array<string>)` |
| `boolean \| 'indeterminate'` | `@unboxed type boolOrIndeterminate = Bool(bool) \| @as("indeterminate") Indeterminate` |
| `number \| ((i: number) => number)` | `@unboxed type itemHeight = Num(float) \| Fn(float => float)` |
| `boolean \| RefObject<HTMLElement> \| ((t) => …)` (base-ui focus targets) | `@unboxed type finalFocus = Bool(bool) \| Ref(React.ref<…>) \| Fn(string => 'a)` — bool/object/function are distinct runtime tags. Fixture: [`ref-union-views`](../test/golden/cases/ref-union-views) |
| `CSSProperties \| ((state: S) => CSSProperties)` (base-ui's state-dependent style; also the checker-resolved `CSSProperties \| (CSSProperties & ((state: S) => CSSProperties))` form) | `@unboxed type sStyle = Style(JsxDOM.style) \| Fn(s => JsxDOM.style)` — an **intersection arm with a call signature counts as the function** (at runtime the value IS a function). Fixture: [`callable-intersection-union`](../test/golden/cases/callable-intersection-union) |

These synthesized variants are de-duplicated into `CommonTypes.res` (module mode) — **by
structure, not by name**: two components sharing a prop name (`style`) but differing in
payload (per-component state records) get two distinct types. A function-bearing union over
exactly one record/enum is named after that dep (`accordionRootState` + `style` →
`accordionRootStyle`); other function-bearing unions keep the prop name.

---

## React-valued & DOM-valued props
Fixture: [`react-dom`](../test/golden/cases/react-dom)

| TypeScript | ReScript | Notes |
|---|---|---|
| `ReactNode` / `ReactElement` / `JSX.Element` | `React.element` | |
| `ReactNode \| ReactNode[]` | `React.element` | React nodes already cover lists/strings |
| `ComponentType<P>` / `FC<P>` / `FunctionComponent<P>` / `ComponentClass<P>` | `React.component<p>` | `P` becomes a generated props record; only when `P` classifies cleanly |
| `Element` | `Dom.element` | a real DOM node (refs, portal targets) |
| `Node` | `Dom.node` | broader than Element (covers DocumentFragment/Text/…) |
| `HTMLDivElement`, `HTMLInputElement`, … | `Dom.htmlDivElement`, … | specific DOM elements, no dependency |
| `RefObject<T>` / `Ref<T>` / `MutableRefObject<T>` | `React.ref<Nullable.t<Dom.element>>` | configurable via `refType` |
| `Element \| DocumentFragment` (all DOM nodes) | `Dom.element` **+ note** | collapses to one node type; an `// ⓘ` note records that DocumentFragment isn't covered |
| `ShadowRoot` | `Dom.shadowRoot` | base-ui portal `container` targets |
| `HTMLElement \| ShadowRoot \| RefObject<…>` (multi-object union) | opaque module with **`from*` views** — `Container.fromHTMLElement / fromShadowRoot / fromRefObject` | objects can't be `@unboxed`-discriminated; views are zero-cost. Fixture: [`ref-union-views`](../test/golden/cases/ref-union-views) |
| `Intl.LocalesArgument` | `string` **+ note** | a BCP-47 tag (`"en-US"`) is the 99% case; `Intl.Locale` objects not modelled |

> `Dom.element` vs `Dom.node`: `Element ⊂ Node`. We use `Dom.element` (ergonomic, no `asNode` cast)
> and note the rare loss; an opaque module is *not* used here because a single native type fits — see
> [opaque modules](#opaque-module-unions) for when no single type fits.

---

## Events & callbacks
Fixtures: [`events-callbacks`](../test/golden/cases/events-callbacks), [`overload-intersection`](../test/golden/cases/overload-intersection)

| TypeScript | ReScript |
|---|---|
| `(e: MouseEvent) => void` (inline) | `ReactEvent.Mouse.t => unit` |
| `(e: ChangeEvent<T>) => void` (inline) | `ReactEvent.Form.t => unit` |
| `ChangeEventHandler<T>` (alias) | `ReactEvent.Form.t => unit` |
| `KeyboardEventHandler<T>` (alias) | `ReactEvent.Keyboard.t => unit` |
| `(value: string, index: number) => void` | `(string, int) => unit` |
| `() => void \| Promise<void>` | `unit => 'a` — polymorphic return covers sync **and** async |
| `(reason?: boolean \| string) => void` (**optional** param) | `option<boolOrString> => unit` — an optional param becomes `option<…>` (`None` = omitted), never a required arg. |
| `((reason?: …) => void) & ((e: MouseEvent) => void)` (overload = intersection of call sigs, or a multi-call-signature interface) | an **opaque module with one zero-cost `%identity` accessor per signature** — `module CloseToastFunc = { type t; external asReason: t => (option<boolOrString> => unit) = "%identity"; external asMouse: t => (ReactEvent.Mouse.t => unit) = "%identity" }`; the prop is typed `…CloseToastFunc.t` with an `ⓘ` note. **No overload is dropped.** Falls back to 🔍 review only if a signature has an untypeable param. See [`overload-intersection`](../test/golden/cases/overload-intersection). |

Both forms work: an **inline** event param maps by the event's **name** (`MouseEvent`→`ReactEvent.Mouse.t`,
`ChangeEvent`→`ReactEvent.Form.t`, `KeyboardEvent`→`ReactEvent.Keyboard.t`, …); a `*EventHandler<T>`
**alias** maps by the alias name (`ChangeEventHandler`, `MouseEventHandler`, `KeyboardEventHandler`, …).

### Event values & distributed eventDetails records
Fixture: [`dom-event-union`](../test/golden/cases/dom-event-union)

| TypeScript | ReScript |
|---|---|
| `event: FocusEvent` (a DOM event as a VALUE, lib.dom-declared) | `Dom.event` — the built-in supertype |
| `event: InputEvent \| FocusEvent \| … \| Event` (base-ui's distributed `ReasonToEvent<R>`) | `Dom.event` — every member is `typeof "object"`, so `@unboxed` could never discriminate; one such field used to poison its whole record/callback into a `string` placeholder |
| `BaseUIChangeEventDetails<'a' \| 'b' \| …>` (a union of instantiations of the SAME generic record) | **one record** over the union's apparent members — `reason` becomes the literal-union variant, `event` becomes `Dom.event`, `cancel: unit => unit` — so `onValueChange: (float, …changeEventDetails) => unit` instead of a loose `string` |

---

## ARIA / role attributes
Fixture: [`aria`](../test/golden/cases/aria)

ARIA props map to their exact `JsxDOM` types verbatim, bypassing the generic union logic:

| TypeScript | ReScript |
|---|---|
| `aria-checked: boolean \| 'false' \| 'mixed' \| 'true'` | `[#"true" \| #"false" \| #mixed]` |
| `aria-disabled: boolean` | `bool` |
| `aria-level: number` | `int` |
| `role: string` | `string` |

The prop name is camelCased with the original kept: `@as("aria-checked") ~ariaChecked`.

---

## Components extending HTML attributes (record-props + `HtmlAttrs.res`)
Fixtures: [`html-attrs-component`](../test/golden/cases/html-attrs-component), [`html-attrs-omit`](../test/golden/cases/html-attrs-omit), [`html-attrs-collision`](../test/golden/cases/html-attrs-collision), [`html-attrs-no-match`](../test/golden/cases/html-attrs-no-match)

A component whose props intersect (or whose interface `extends`) a React attribute
interface — `ButtonHTMLAttributes<T>`, `InputHTMLAttributes<T>`, any `*HTMLAttributes`,
optionally wrapped in `Omit<…, K>` / `Partial<…>` — does NOT inline the attribute
surface as labeled args. It emits the **record-props form** with one shared spread:

| TypeScript | ReScript |
|---|---|
| `OwnProps & ButtonHTMLAttributes<HTMLButtonElement>` | `type props = { ...HtmlAttrs.buttonHTMLAttributes, <own fields> }` + `external make: React.component<props>` |
| `OwnProps & Omit<ButtonHTMLAttributes<…>, 'style' \| 'className'>` | spread of a **narrowed variant** `HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle` — only the hierarchy slice containing the removed keys is re-materialized; aria + events stay shared. Variants are deduped by removed-set. |
| own prop colliding with a chain field (e.g. own `onClick: (v, i) => void`) | the own prop WINS with its own mapping; the base spread is narrowed (`…OmitOnClick`) so a duplicate-field compile error is impossible |
| `& SVGAttributes<…>` / `& AllHTMLAttributes<…>` / non-literal `Omit` keys / generic component / `--file`/`--stdout` mode | **legacy labeled-args output** (unchanged) |

`HtmlAttrs.res` is written once per run (manifest-tracked) and models React's hierarchy
with record type spread, generated from the **exact-pinned `@types/react` devDependency**
(see `src/html-attrs-data.mjs` header for the pin):

```
ariaAttributes (53)   domAttributes (~190 events incl. capture)
        └────────┬─────────┘
          htmlAttributes (+55 globals)
                 │
  per-element leaves: buttonHTMLAttributes, inputHTMLAttributes, …
```

JSX call sites are unchanged (JSX v4 lowers to the `make`/`props` pair):
`<Button text="hi" disabled=true ariaLabel="x" />` and `<Button {...base} text="y" />`
both type-check. Non-JSX direct `Module.make(...)` calls change shape — that is the
consumer-visible difference.

**Regeneration contract:** new web-platform attributes arrive by bumping the
`@types/react` pin → `npm run gen:attrs` → reviewing the `src/html-attrs-data.mjs` and
golden diffs. `--no-html-attrs` restores the legacy inlined output wholesale.

---

## Records, recursion & utility unwrapping
Fixture: [`records`](../test/golden/cases/records)

| TypeScript | ReScript |
|---|---|
| anonymous `{ x: number; y: number }` | `type pointConfig = { x: float, y: float }` (named after the prop) |
| named `interface MenuItemType { … }` | `type menuItemType = { … }` |
| self-referential `{ subItems?: MenuItemType[] }` | `type rec menuItemType = { subItems?: array<menuItemType> }` (`rec` **only** when genuinely recursive) |
| `Partial<BaseProps>` | record with all fields optional (utility unwrapped: `Partial`/`Required`/`Readonly`/`Pick`/`Omit`/`NonNullable`) |
| `interface X extends HTMLAttributes<…>` | `type … = { ...JsxDOM.domProps, <own fields> }` |

In module mode these live in per-domain `*Types.res` modules, deduplicated by type identity and
referenced qualified (`MenuTypes.menuItemType`); cyclic groups merge via SCC.

**`@unboxed` inside a record cycle.** A field like `labelGrid?: string | ((…, Options) => string)`
becomes an object-bearing `@unboxed`, and if its function arm references back into the record cycle
(`Labels → Options → Locale → Labels`) the `@unboxed` is genuinely part of the recursion. It can't be
a separate declaration (forward reference either way), so it's **folded into the `type rec … and …`
group** as `@unboxed and labelGrid = Str(string) | Fn(…)`. Fixture:
[`unboxed-in-record-cycle`](../test/golden/cases/unboxed-in-record-cycle).

**Warning 30 (duplicate labels/constructors).** When a mutually-recursive `type rec A = {…} and B = {…}`
group holds two members that share a **name** — a record field label (Highcharts
`tooltip`/`legend`/`point`/`series` all have `chart`/`options`/`update`), or a variant constructor of a
folded `@unboxed` (several label unions all using `Str`/`Fn`) — ReScript emits *warning 30*. The
generator prepends **`@@warning("-30")`** to exactly those files: the duplication is intentional and
every value is explicitly typed, so the ambiguity warning is pure noise. Independent `type`
declarations sharing a name do **not** warn, so they get no pragma. Fixtures:
[`dup-labels`](../test/golden/cases/dup-labels), [`unboxed-in-record-cycle`](../test/golden/cases/unboxed-in-record-cycle);
the compile runner asserts generated output is warning-free.

**Prototype-safe name lookups.** Props/params named after `Object.prototype` members (`toString`,
`valueOf`, `hasOwnProperty`, …) are looked up in the event/aria maps with own-property guards, so they
never pick up an inherited native function. Fixture: [`proto-named-method`](../test/golden/cases/proto-named-method).

---

## Generics & erased generics
Fixture: [`generics`](../test/golden/cases/generics)

A **genuine** generic component maps its type parameter to a ReScript type variable:

| TypeScript | ReScript |
|---|---|
| `VirtualList<T>(props: { items: T[]; renderItem: (item: T, i: number) => ReactNode })` | `~items: array<'a>`, `~renderItem: ('a, int) => React.element` |
| **prop-position `any`** — `type AccordionValue = (any \| null)[]`; `value?: AccordionValue`, `onValueChange?: (v: AccordionValue) => void` | an **implicit** component generic: `~value: array<'a>=?`, `~onValueChange: array<'a> => unit=?` — vars are **keyed by the carrying alias** so props over one alias unify; a bare `any` gets a fresh var per occurrence. Exactly as sound as the upstream `any`, strictly better than a broken `string` placeholder. Inside SHARED record fields `any` stays a flagged defect (a shared type can't be component-generic). Fixture: [`any-to-typevar`](../test/golden/cases/any-to-typevar) |

An **erased** generic — a `forwardRef`/`memo` export that pins the parameter to a placeholder
(`Record<string, unknown>`) — is *re-genericized*: the placeholder is recovered as `'a`, `unknown`
becomes `JSON.t`, `keyof T` becomes `string`, and nested records carry the type variable:

```rescript
// export: ForwardRefExoticComponent<TableProps<Record<string, unknown>> & RefAttributes<…>>
~data: array<'a>,
~idField: string,                         // ⚪ loose — was `keyof T`
~onRowClick: ('a, int) => unit,
~onSave: (JSON.t, 'a) => unit,            // rowId opaque, row typed
~filterComponent: React.component<rowFilterProps>,
```

> **`'a` vs `JSON.t`:** the row `T` round-trips (you supply it via `data`, the library hands it
> back in callbacks) → sound as a type variable `'a`. A standalone `unknown` (a `rowId`, a filter
> value) doesn't round-trip → `JSON.t`. A free type variable in callback position would let the
> caller pick a type the library doesn't actually produce — unsound.
>
> **Limitation:** recovery keys on the props being a generic **type alias** (`type Props<T> = …`,
> how real libraries ship it). A generic **`interface`** instantiation is not currently
> re-genericized (no `aliasSymbol`) — it would surface as `Record<string,unknown>` → `Dict.t<JSON.t>`.

---

## Opaque-module unions
Fixtures: [`opaque-modules`](../test/golden/cases/opaque-modules), [`webapi`](../test/golden/cases/webapi), [`overload-intersection`](../test/golden/cases/overload-intersection)

When a union can't be an `@unboxed` variant — **multiple object shapes**, or **object | array<object>**
(abstract members that `typeof`/`Array.isArray` can't split into a recognized variant shape) — it
becomes an opaque-type module: an abstract `t` plus zero-cost `%identity` `from*` constructors.

```rescript
module Preset = {
  type t
  external fromDateRangePreset: dateRangePreset => t = "%identity"
  external fromCustomConfig: customConfig => t = "%identity"
  external fromCustomDefinition: customDefinition => t = "%identity"
}
module Boundary = {           // Element | Element[]
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
}
```

The prop is typed `…Preset.t` with an `// ⓘ` note listing the constructors. The value passes
straight through (zero runtime cost).

### Reverse `as*` accessors — overloaded functions
An **overloaded function** (≥2 call signatures — a TS intersection of call sigs `A & B`, or a
multi-call-signature interface) has no native ReScript type. It becomes an opaque module with one
zero-cost `%identity` **accessor** per signature (the reverse direction: opaque→concrete), so every
overload stays callable. The consumer picks the view they need.

```rescript
// `((reason?: boolean | string) => void) & ((e: MouseEvent) => void)`
module CloseToastFunc = {
  type t
  external asReason: t => (option<boolOrString> => unit) = "%identity"  // close, optional reason
  external asMouse:  t => (ReactEvent.Mouse.t => unit)   = "%identity"  // use directly as onClick
}
```
Usage: `CloseToastFunc.asReason(closeToast)(None)`; `onClick={CloseToastFunc.asMouse(closeToast)}`.
Accessor names: `as` + the first param's name (`reason` → `asReason`), else the React-event type
(`e: MouseEvent` → `asMouse`), else `asThunk` for a no-arg signature. Bucketed ✅ usable (nothing
dropped); falls back to 🔍 review only if a signature has an untypeable param.

`from*` constructors and `as*` accessors are the **only** sanctioned uses of `%identity` — both are
zero-cost (value-through).

| TypeScript | ReScript |
|---|---|
| `A \| B \| C` (≥2 object shapes) | `module … { fromA / fromB / fromC }` |
| `Element \| Element[]` | `module … { fromElement / fromElements }` |
| `File \| File[]` (with `--webapi`) | `module … { fromFile / fromFiles }` |
| `((a?: T) => void) & ((e: MouseEvent) => void)` (overloaded fn) | `module … { asA: t => (option<T> => unit) / asMouse: t => (ReactEvent.Mouse.t => unit) }` |

---

## Standalone function exports (non-React)
Fixture: [`fn-exports`](../test/golden/cases/fn-exports)

Beyond React components, a package's plain **function exports** (and `const`s whose type has a call
signature) are bound too — this is what lets the generator target non-React TS libraries (Hono,
date-fns, …). Each becomes a `@module external` in one bundled `<Pkg>Bindings.res` file. **Required
params bind positionally; optional params bind as labeled `~name=?`** (a positional external can't
express a trailing optional — `nanoid(size?)` would otherwise force the arg), with a `unit` sentinel
so the optional can be omitted. The JS export name stays in the `= "…"` string, so a reserved or
capitalized name still binds. Params and the return reuse the same `classify` pipeline as component
props, so named types land in the shared `*Types.res` (referenced qualified).

| TypeScript export | ReScript |
|---|---|
| `function add(a: number, b: number): number` | `@module("pkg") external add: (float, float) => float = "add"` |
| `function now(): number` (zero args) | `@module("pkg") external now: unit => float = "now"` — an external can't take no args |
| `function forEach(items: number[], fn: (v: number, i: number) => void): void` | `external forEach: (array<float>, (float, float) => unit) => unit = "forEach"` |
| `function greet(name: string, greeting?: string): string` | `external greet: (string, ~greeting: string=?, unit) => string = "greet"` (optional → labeled `=?`) |
| `const translate: (p: Point, dx: number, dy: number) => Point` | `external translate: (PkgTypes.point, float, float) => PkgTypes.point = "translate"` (named `Point` → shared record) |

Same buckets apply: a param/return that can't be typed exactly falls back to the flagged placeholder
with a leading `// ⚪ loose` / `// ⚠️ REVIEW` / `// 🛑 BROKEN` comment above the binding (flag-don't-fake).
Bare type-alias/interface exports with no value reference are **not** bound yet — they're still
reported as `skipped` (planned as a later milestone).

**Default exports** ([`default-export`](../test/golden/cases/default-export)) bind the JS name
`= "default"` (the ReScript id keeps the declaration's own name, e.g. `greet`), and carry a flag:
a package that does `module.exports = fn` (plain CJS) exposes the value as the module itself, so
`require("pkg").default` is undefined — the consumer must verify that case at runtime.

**Return-only generics** ([`fn-optional-generic`](../test/golden/cases/fn-optional-generic)) are
demoted to their constraint, never `'a`. A type parameter used *only* in the return doesn't
round-trip, so `'a` would be unsound (rule #4): `nanoid<T extends string>(size?): T` becomes
`(~size: int=?, unit) => string`, not `=> 'a`. A param like `pluck<T>(items: T[]): T` keeps `'a`,
because `T` *does* round-trip (it appears in a parameter).

---

## Class exports (non-React)
Fixture: [`class-exports`](../test/golden/cases/class-exports)

A `class` export binds to its **own `<ClassName>.res` file** (a file *is* a ReScript module) holding
the canonical abstract-`type t` pattern: constructor → `@new`, instance methods → `@send` (the
instance is the first arg), data properties / getters → `@get`. Member param/return types reuse the
same `classify` pipeline, so records/enums/unions land in the shared `*Types.res`.

Method/constructor params bind as **labeled args** (unlike [function exports](#standalone-function-exports-non-react),
which are positional) — class APIs lean on optional params, and ReScript only allows optionals when
labeled. A trailing optional gets a `unit` sentinel, the standard ReScript pattern.

**The `InstanceTypes` sink.** Every class's abstract instance type lives in a single dependency-free
module, `InstanceTypes` (`type counter`, `type tracker`, …). Each class file aliases its own
(`type t = InstanceTypes.counter`), and *every* reference to a class — from another class, or from a
shared record — points at the sink, **not** at the class file. This is deliberate: it makes the
instance type a dependency *sink* (it imports nothing), so a `*Types.res` record that mentions a
class can never form a cross-file cycle back through the class file (see
[`class-type-cycle`](../test/golden/cases/class-type-cycle)). It also means a reference to a class
we don't fully emit (e.g. a generic one) still resolves to its abstract type — never a dangling
`X.t`. A self-reference inside the class's own file still renders as the tidy bare `t`.

| TypeScript | ReScript (in `Counter.res`, with `type t = InstanceTypes.counter`) |
|---|---|
| `class Counter { constructor(start: number, step?: number) }` | `@new @module("pkg") external make: (~start: float, ~step: int=?, unit) => t = "Counter"` |
| `increment(by: number): Counter` (returns self) | `@send external increment: (t, ~by: float) => t = "increment"` |
| `get(...): HonoBase<…>` (returns a NON-exported first-party base — hono's chaining shape) | `@send external get: (t, …) => t = "get"` — base-class symbols of exported classes register transitively (ambiguity-guarded; **library** bases like `Date`/`EventTarget` are never claimed). Fixture: [`class-self-return`](../test/golden/cases/class-self-return) |
| `get value(): number` | `@get external value: t => float = "value"` |
| `reset(): void` | `@send external reset: (t) => unit = "reset"` |
| `watch(counter: Counter): void` (other class, in `Tracker.res`) | `@send external watch: (t, ~counter: InstanceTypes.counter) => unit = "watch"` |

Same flag-don't-fake buckets apply per member. **First-slice scope:** non-generic classes,
constructor + instance methods + getters. **Static members and generic class type parameters
(`class Hono<E, S>`) are not bound yet** — generic classes bind their non-generic surface and flag
the rest.

### Structural record dedup
Fixture: [`generic-record-dedup`](../test/golden/cases/generic-record-dedup)

Shared records are deduped by **structure**, not just by TypeScript type id. A generic library
(Hono, Effect, anything with phantom-typed builders) produces hundreds of *distinct* instantiations
of the same shape — `Router<S & {a}>`, `Router<S & {a} & {b}>`, … — that become **byte-for-byte
identical once the phantom generics widen** to `string`/opaque. Keying only on type id would emit one
record per instantiation (Hono: **1728** near-identical `honoNNN` records, a 1.3 MB file). So after a
record's fields are built, its structural signature is hashed; an identical existing record is reused
and the duplicate dropped (recursive records carry a self-key, so they never falsely merge). For Hono
this collapses **2040 → ~180** shared types and lets the whole binding compile. `opaque`/`review`/
`unknown`/`any` all hash the same (they render to the same placeholder), so widened duplicates merge.

---

## Web platform types (gated on `--webapi`)
Fixture: [`webapi`](../test/golden/cases/webapi)

| TypeScript | ReScript (`--webapi`) | ReScript (default) |
|---|---|---|
| `File` | `Webapi.File.t` | ⚪ `string` (flagged; install `rescript-webapi`) |
| `FileList` | `Webapi.FileList.t` | ⚪ `string` |
| `FormData` | `Webapi.FormData.t` | ⚪ `string` |

`--webapi` is auto-enabled when the target project depends on `rescript-webapi`; otherwise the CLI
asks (or flags the props). `(d: FormData) => void | Promise<void>` → `Webapi.FormData.t => 'a`.

### The `WebTypes` sink (always on, module mode)
Fixture: [`web-platform-types`](../test/golden/cases/web-platform-types)

Web-platform **classes** map to abstract types in a dependency-free generated `WebTypes.res`
(the [`InstanceTypes`](#class-exports-non-react) pattern) — zero-cost, honest (no fake
structure), and chainable, instead of flagged `string` placeholders. Only types actually
referenced are emitted. Guarded on the symbol being **declared in lib.dom/lib.webworker**, so a
package's own class named `Response` is never hijacked.

| TypeScript | ReScript |
|---|---|
| `Request`, `Response`, `Headers`, `URL`, `URLSearchParams`, `AbortSignal`, `AbortController`, `Blob`, `ReadableStream`, `WritableStream`, `WebSocket` | `WebTypes.request`, `WebTypes.response`, … (abstract `type` per name) |
| `fetch(req: Request): Response \| Promise<Response>` (sync-or-async value) | `(t, ~req: WebTypes.request) => promise<WebTypes.response>` — `await` handles a bare value at runtime; an `@unboxed` can't discriminate two object types |
| `Promise<T>` (bare) | `promise<t>`; `Promise<void>` → `promise<unit>` |

Deliberately excluded from the sink: collision-prone ambient names (`Event`, `Body`, `Text`).
Future work (not gated yet): upgrading a verified subset to `Webapi.Fetch.*` under `--webapi`.
Single-file (`--file`/`--stdout`) mode keeps the flagged fallback (no second output file).

---

## Namespace exports (`export * as NS`)
Fixture: [`namespace-exports`](../test/golden/cases/namespace-exports)

A component whose VALUE is reachable as a namespace member binds **through the namespace
object** — the flat re-export may be `export type *` (type-only), in which case a flat
binding (`= "AccordionRoot"`) is `undefined` at runtime (base-ui's actual shape; this was
a runtime-correctness bug, not just ergonomics):

| TypeScript | ReScript |
|---|---|
| `export * as Accordion from './parts'` + member `Root` | `AccordionRoot.res`: `@module("pkg") @scope("Accordion") external make: … = "Root"` |
| (per namespace with ≥1 extracted component) | `Accordion.res`: `module Root = AccordionRoot` … — zero-cost aliases enabling the documented `<Accordion.Root>` JSX idiom |

Scope binding is correct whether or not a flat VALUE export also exists. A namespace whose
name collides with an emitted module is skipped (`ns-name-collision`). Namespaced classes /
functions are a follow-up — only components bind through namespaces today.

---

## Worked examples (from real `@juspay/blend-design-system` work)

| Real prop | Shape | Resolution | Pattern |
|---|---|---|---|
| `Menu.collisonBoundaryRef` | `Element \| Element[]` | `module CollisonBoundaryRef { fromElement / fromElements }` | [opaque module](#opaque-module-unions) |
| `DateRangePicker.customPresets` | `(A \| B \| C)[]` | `module PresetsConfig { from… }` | opaque module |
| `Upload.value` / `onChange` | `File \| File[]` | `module UploadFormValue { fromFile / fromFiles }` | opaque module + `--webapi` |
| `DrawerPortal.container` | `Element \| DocumentFragment` | `Dom.element` + note | [DOM union](#react-valued--dom-valued-props) |
| `DataTable.*` | `DataTableProps<Record<string,unknown>>` | re-genericized `'a`, `keyof T`→`string`, `unknown`→`JSON.t` | [erased generic](#generics--erased-generics) |
| `DataTable.advancedFilterComponent` | `ComponentType<AdvancedFilterProps>` | `React.component<advancedFilterProps>` | [component prop](#react-valued--dom-valued-props) |
| `*.formAction` | `(fd: FormData) => void \| Promise<void>` | `Webapi.FormData.t => 'a` | [callback](#events--callbacks) |
| `Menu.virtualItemHeight` | `number \| ((…) => number)` | `@unboxed … = Num(float) \| Fn(…)` | [@unboxed](#unboxed-unions) |
| `TextInput.type` | `HTMLInputTypeAttribute` | enum (open-union escape dropped) | [enum](#string-literal-unions--enums) |

---

## Known issues

_None currently in the type-mapping layer._ (The `*EventHandler` alias `unit => unit` bug — where
`EVENT_HANDLERS` emitted `{arg}` while `renderType` read `params` — is **fixed** and covered by the
[events-callbacks](../test/golden/cases/events-callbacks) golden.)

Broader generator gaps tracked outside this file (export/file targeting, not type mapping): binding
component **token** shapes instead of `*Props`, orphaned `*V2Types.res` with no `make`, binding
non-existent package exports, deep `dist/...` imports. See the blend `BINDINGS_REVIEW.md`.

---

## Maintenance

This file is a **living contract**, not just docs. When you add or change a mapping:

1. **Update the relevant table here** (and [Worked examples](#worked-examples-from-real-juspayblend-design-system-work) / [Known issues](#known-issues) if applicable).
2. **Add or extend a fixture** under [`test/golden/cases/<name>/`](../test/golden/cases) — a
   self-contained `index.d.ts` (inline stubs + `lib.dom`, no installs) plus `args.json`.
3. **Regenerate the golden:** `npm run test:golden:update`, then eyeball the diff for correctness.
4. **Verify:** `npm test` (smoke + golden snapshot) and `npm run test:compile` (goldens compile on
   ReScript) both pass.

CI runs the snapshot diff **and** the compile check on every PR (both blocking), so output can't
drift from this reference without a failing build.
