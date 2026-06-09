# TypeScript → ReScript mapping reference

> **The bible.** This is the canonical, executable contract for how
> `@juspay/rescript-bindgen` turns a TypeScript `.d.ts` into ReScript bindings.
> Every rule below is backed by a fixture in [`test/golden/cases/`](../test/golden/cases)
> whose committed output is diffed **and** compiled in CI. If you change a mapping,
> you change a row here, a fixture, and its golden — together. See [Maintenance](#maintenance).

## The contract (read this first)

1. **No unsafe casts.** Never `Obj.magic`, `@unwrap`, or a bare `%identity`. The *only*
   permitted `%identity` is the zero-cost `external from*` constructor of an
   [opaque-type module](#opaque-module-unions), where the value genuinely passes through unchanged.
2. **Flag, don't fake.** If a type can't be modelled exactly, emit a `string` placeholder
   with a comment and bucket it (⚪ loose / 🔍 review / 🛑 broken) — never a plausible-but-wrong type.
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

---

## String-literal unions & enums
Fixture: [`string-enums`](../test/golden/cases/string-enums)

| TypeScript | ReScript |
|---|---|
| `'sm' \| 'md' \| 'lg'` | `type size = \| @as("sm") Sm \| @as("md") Md \| @as("lg") Lg` |
| `'a' \| 'b' \| (string & {})` | a plain enum — the `string & {}` "open" escape is dropped (this is the `HTMLInputTypeAttribute` shape) |
| real `enum` | same `@as` variant form |

Constructors are PascalCased from the literal (`"icon-only"` → `IconOnly`, `"2xl"` → `V2xl`). A
prop literally named `type` becomes `@as("type") ~type_` (reserved-word escaping).

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

These synthesized variants are de-duplicated into `CommonTypes.res` (module mode).

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

> `Dom.element` vs `Dom.node`: `Element ⊂ Node`. We use `Dom.element` (ergonomic, no `asNode` cast)
> and note the rare loss; an opaque module is *not* used here because a single native type fits — see
> [opaque modules](#opaque-module-unions) for when no single type fits.

---

## Events & callbacks
Fixture: [`events-callbacks`](../test/golden/cases/events-callbacks)

| TypeScript | ReScript |
|---|---|
| `(e: MouseEvent) => void` (inline) | `ReactEvent.Mouse.t => unit` |
| `(e: ChangeEvent<T>) => void` (inline) | `ReactEvent.Form.t => unit` |
| `ChangeEventHandler<T>` (alias) | `ReactEvent.Form.t => unit` |
| `KeyboardEventHandler<T>` (alias) | `ReactEvent.Keyboard.t => unit` |
| `(value: string, index: number) => void` | `(string, int) => unit` |
| `() => void \| Promise<void>` | `unit => 'a` — polymorphic return covers sync **and** async |

Both forms work: an **inline** event param maps by the event's **name** (`MouseEvent`→`ReactEvent.Mouse.t`,
`ChangeEvent`→`ReactEvent.Form.t`, `KeyboardEvent`→`ReactEvent.Keyboard.t`, …); a `*EventHandler<T>`
**alias** maps by the alias name (`ChangeEventHandler`, `MouseEventHandler`, `KeyboardEventHandler`, …).

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
Fixture: [`opaque-modules`](../test/golden/cases/opaque-modules), [`webapi`](../test/golden/cases/webapi)

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

The prop is typed `…Preset.t` with an `// ⓘ` note listing the constructors. This is the **only**
sanctioned use of `%identity` — the value passes straight through (zero runtime cost).

| TypeScript | ReScript |
|---|---|
| `A \| B \| C` (≥2 object shapes) | `module … { fromA / fromB / fromC }` |
| `Element \| Element[]` | `module … { fromElement / fromElements }` |
| `File \| File[]` (with `--webapi`) | `module … { fromFile / fromFiles }` |

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
