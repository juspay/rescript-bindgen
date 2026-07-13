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

The report buckets a prop by the *worst* imperfection in its **own** type tree. In module mode it
*also* looks THROUGH typeRefs into shared types (#133), but with a deliberate cap: a defect reached
only *through* a shared type elevates the carrying component to **🔍 review AT MOST, never 🛑
broken** — the prop's own surface binds; a shared type it references carries a flagged field a human
should check. A *direct* `any`/`unknown` on the prop still buckets 🛑 broken. The review row names
the owning type + field (`config.theme`). This keeps a flagship component off the "broken" list over
a leaf buried deep in a library type, while still pulling it out of "✅ use directly" so nothing
reads silently usable. A nested ⚪ loose field doesn't elevate at all (it doesn't change usability;
the shared type's own inline comment covers it). Fixture:
[`shared-defect-report`](../test/golden/cases/shared-defect-report).

| Bucket | Meaning | Emitted as |
|---|---|---|
| ✅ exact | maps precisely | the real ReScript type |
| ⚪ loose | a real but complex type widened | `string` + `// ⚪ loose — was …` |
| 🔍 review | a multi-type prop we refuse to bind unsafely, **or** a prop that binds but references a shared type with a flagged field (#133) | `string` + `// ⚠️ REVIEW` |
| 🛑 broken | the prop's OWN type resolved to `any` (untyped) | `string` + `// 🛑 BROKEN` |

---

## Primitives & opaque values
Fixtures: [`primitives`](../test/golden/cases/primitives), [`branded-types`](../test/golden/cases/branded-types)

| TypeScript | ReScript | Notes |
|---|---|---|
| `string` | `string` | |
| `number` | `int` *or* `float` | name heuristic: count-like names (`count`, `width`, `index`, `size`, `length`, `tabIndex`, …) → `int`; else `float` |
| `boolean` | `bool` | |
| `bigint` (and a `bigint` literal `123n`) | `bigint` | first-class ReScript 12 type (`Stdlib_BigInt`). A bigint literal folds into the `bigint` type (no `@as` for bigint literals). (#70) |
| branded primitive — `type UserId = string & {readonly __brand: "user"}` | `@unboxed type userId = UserId(string)` | the marker object is phantom; the runtime value remains a primitive. A single-constructor `@unboxed` wrapper is zero-cost while preserving nominal separation. Each alias keeps its own type, so branded strings and numbers cannot collapse into one fake marker record. A branded `number` payload uses `float`. Fixture: [`branded-types`](../test/golden/cases/branded-types). (#106) |
| `keyof T` (an index type, incl. over a generic `T`) | `string` | a key is a string at runtime; keeps an array faithful — `(keyof T)[]` → `array<string>` instead of collapsing the whole prop to a flat `string`. Fixture: [`shape-collapse`](../test/golden/cases/shape-collapse). (#79) |
| `React.ComponentProps<'div'>` / `DetailedHTMLProps<HTMLAttributes<…>, …>` / `ComponentPropsWith(out)Ref` (all DOM attrs of an element) | `JsxDOM.domProps` | the DOM-attribute bag bindgen already uses for HTML-attr spreads — never a flagged `string`. Fixture: [`shape-collapse`](../test/golden/cases/shape-collapse). (#79) |
| `unknown` | `JSON.t` | opaque value you build/decode — **not** a defect, **not** a type variable |
| `any` | 🛑 `string` | genuinely untyped → flagged broken |
| `Date` | `Date.t` | |
| `T[]` / `Array<T>` | `array<…>` | element classified recursively |
| `[number, number]` / `[string, number]` (fixed-arity tuple) | `(float, float)` / `(string, float)` — a ReScript tuple; elements classified recursively (no prop name, so `number`→`float`). A variadic/rest tuple (`[number, ...string[]]`) or an optional-element tuple (`[number, number?]`) stays the flagged `string` fallback (ReScript tuples are fixed-arity with no optional slots). A **1-tuple** (`[T]` / `[T?]`) has no ReScript tuple form either, but IS faithfully an `array<T>` (a 0-or-1 sequence) — `[ReactNode?]` → `array<React.element>`, not `string`. Fixture: [`tuples`](../test/golden/cases/tuples) (`single`). (#65 B5, #83) |
| `[boolean] \| [boolean, boolean] \| [boolean, boolean, boolean]` (union of fixed tuples over ONE primitive — highcharts-react's `updateArgs`) | `array<bool>` — every arm is a runtime array of the same element, differing only in **length**, which ReScript can't express anyway. Was: fell through `unionNode` to a loose `string`, which can never carry the array. Same-primitive only — a mixed tuple union (`[string] \| [string, number]`) stays the flagged fallback. Fixture: [`module-object-and-tuple-union`](../test/golden/cases/module-object-and-tuple-union). (#98) |
| `typeof Highcharts` / `typeof import("…")` (a module/namespace OBJECT in value position — highcharts-react's `highcharts` prop) | an abstract **nominal type** in the `InstanceTypes` sink (`InstanceTypes.highchartsModule`), deduped per module symbol. The module object's hundreds of members are useless to model structurally, but the value must be **passable** — the consumer holds it via their own import binding and threads it through untouched. Was: opaque → loose `string`, forcing an `%identity` cast downstream. Fixture: [`module-object-and-tuple-union`](../test/golden/cases/module-object-and-tuple-union). (#98) |
| `Item[] & Array<Item & { nestedItems?: … }>` (intersection of array types) | `array<…>` of the **intersected element** — `isArrayType` is false for an intersection, so this is detected via the number-index type; otherwise it fell to a record built from the array's prototype methods (`{ ...JsxDOM.domProps }`, array wrapper lost — NestedSelectDrawer's `items`). Fixture: [`intersection-of-arrays`](../test/golden/cases/intersection-of-arrays). (#63 review) |
| `Preset[] \| RangeConfig[] \| RangeDefinition[] \| (Preset \| RangeConfig \| RangeDefinition)[]` (union of array types — DateRangePicker's `PresetsConfig`) | `array<«element union»>`. The distinct element types are collected (an enum arm re-grouped to its enum, **not** expanded to its literals), then bound by the usual union machinery — here multiple object shapes → an [opaque module](#opaque-module-unions) with one `from*` view each (`array<…PresetsConfig.t>`). Every arm shares the global `Array` symbol, so the same-generic-record union collapse (added for `BaseUIChangeEventDetails<R>`) wrongly matched and built a record from `Array`'s prototype methods (`{ ...JsxDOM.domProps }`, array shape lost). Closed by an `isBuiltinContainer` guard that excludes the WHOLE class of lib.es containers whose instantiations share one global symbol — `Array`, `Map`, `Set`, `Promise`, `WeakMap`, `WeakSet`, `Readonly*` (`Map<A> \| Map<B>` fell into the identical trap). It's narrower than `!isLibraryType` on purpose: that would also block `@types`/csstype records that legitimately collapse (regressed hono's `headerRecord`, react-markdown's `HastTypes.readonly`). A first-party record (`BaseUIChangeEventDetails<R>`) is no container, so its real collapse survives. Fixtures: [`union-of-arrays`](../test/golden/cases/union-of-arrays), [`union-of-maps`](../test/golden/cases/union-of-maps). (#65, #67, #68) |
| `Map<string, OnClick> \| Map<string, OnHover>` (union of non-array lib.es containers — `Map`/`Set`/`Promise`/…) | an [opaque module](#opaque-module-unions) with one construct-only `from*` view per arm — `Handlers.t` with `external fromMapOnClick: Map.t<string, string => unit> => t` / `fromMapOnHover: Map.t<string, string => bool> => t`. Each arm types cleanly alone (a single `Map<K,V>` → `Map.t<K,V>`), but the arms are runtime-indistinguishable (all `object`), so an `@unboxed` variant can't tell them apart and the union would drop to `string`. The opaque module is construct-only (build a typed `Map.t` and cast) — the SAME faithful treatment the union-of-arrays case gets. Arms are named by value/element type (`fromMap<Value>`) since the bare container name repeats. Fixture: [`union-of-maps`](../test/golden/cases/union-of-maps). (#68) |
| `(Preset \| RangeConfig \| RangeDefinition)[]` — the **single-array** form (what the union above reduces to when a library simplifies the type) | the SAME `array<…opaque module>` as the union-of-arrays form. The array branch detects an element union with ≥2 object/array arms and calls `opaqueUnion` on its distinct members directly — needed because the element's record arms are `type X = {…}` aliases (`__type` symbol) that `unionNode`'s `isStructured` gate rejects (else `string`). Named after the array's alias, so the single form and the union-of-arrays form yield an identical binding. Fixture: [`union-of-arrays`](../test/golden/cases/union-of-arrays) (`presetsSingle`). (#65 ↩) |
| `Rec \| Rec[]` — an object (incl. an **intersection** `A & {…}`) OR an array of it (TextInputV2's `dropdown`) | an [opaque module](#opaque-module-unions) with a `from<Rec>` (object) + `from<Rec>s` (array) view. An intersection arm has no own `getSymbol()`, so it was dropped from the union's structured arms → `string`; now counted by its properties. Fixture: [`shape-collapse`](../test/golden/cases/shape-collapse). (#79) |
| `Record<string, V>` | `Dict.t<…>` | `Record<string, unknown>` → `Dict.t<JSON.t>`; `Record<string, string>` → `Dict.t<string>` |
| **Record with a string index signature AND named props** — `CSSObject`: `{ [key: string]: bool\|number\|string; backgroundColor?: … }` | the named fields stay a **typed record** `type cssObjectHighcharts = {…}`, PLUS a `@set_index` setter `@set_index external cssObjectHighchartsSet: (cssObjectHighcharts, string, boolOrStringOrNumber) => unit = ""`. Consumers set an **un-named** key at a FLAT runtime position: `style->cssObjectHighchartsSet("zIndex", Num(100000.))` → `style["zIndex"] = 100000`. Keeps named typing (a plain `Dict.t` would drop the 25 named CSS fields) with **no unsafe cast** (`@set_index` is a first-class ReScript primitive, as used by `rescript-webapi` itself). Value type is the index sig's, `JSON.t` when imperfect. A PURE index object (no named props) still maps to `Dict.t` (row above). Fixture: [`index-signature-setter`](../test/golden/cases/index-signature-setter). (#119) |
| `Map<K, V>` / `ReadonlyMap` / `WeakMap` | `Map.t<k, v>` | detected on the resolved symbol, so a first-party alias (`type EventHandlerMap = Map<…>`) is caught too — never a `{...JsxDOM.domProps}` record ([`builtin-map-set`](../test/golden/cases/builtin-map-set)) |
| `Set<T>` / `ReadonlySet` / `WeakSet` | `Set.t<t>` | as above |

---

## String-literal unions & enums
Fixtures: [`string-enums`](../test/golden/cases/string-enums), [`literal-union-open`](../test/golden/cases/literal-union-open)

| TypeScript | ReScript |
|---|---|
| `'sm' \| 'md' \| 'lg'` | `type size = \| @as("sm") Sm \| @as("md") Md \| @as("lg") Lg` |
| `'a' \| 'A' \| 'm' \| 'M'` (case-only-distinct) | `\| @as("a") A \| @as("A") A2 \| @as("m") M \| @as("M") M2` — constructors that PascalCase to the same name get a numeric suffix (the `@as` keeps the real value). Fixture: [`enum-case-collision`](../test/golden/cases/enum-case-collision) |
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
| `string \| number \| bigint` (SingleSelectV2 `VirtualItemShape.key`) | `@unboxed type stringOrNumberOrBigInt = Str(string) \| Num(float) \| Big(bigint)` — `bigint` is its own JS `typeof` bucket, so it discriminates cleanly alongside string/number. Previously the unrecognized `bigint` arm bailed the whole `@unboxed` build and the union silently became bare `string` (dropping `number` too). `number \| bigint` → `numberOrBigInt`. Fixture: [`bigint`](../test/golden/cases/bigint). (#70) |
| `string \| string[]` | `@unboxed type stringOrStringArray = Str(string) \| StrArr(array<string>)` |
| `boolean \| 'indeterminate'` | `@unboxed type boolOrIndeterminate = Bool(bool) \| @as("indeterminate") Indeterminate` |
| `number \| ((i: number) => number)` | `@unboxed type itemHeight = Num(float) \| Fn(float => float)` |
| `boolean \| RefObject<HTMLElement> \| ((t) => bool)` (clean-return fn) | `@unboxed type toggleFocus = Bool(bool) \| Ref(React.ref<…>) \| Fn(bool => bool)` — bool/object/function are distinct runtime tags. An unmodellable fn PARAM is salvaged to a fresh type variable (`Fn('x => …)` — the hole the consumer must annotate; params flow library→consumer). A fn member whose RETURN can't be modelled (`=> boolean \| void \| HTMLElement`) keeps the honest ⚠️ REVIEW flag instead: a fake `=> string` inside a shared `@unboxed` would render unflagged and feed wrong values INTO the library. Fixture: [`ref-union-views`](../test/golden/cases/ref-union-views) |
| `string \| <opaque>[]` — an array whose ELEMENT can't be modelled (NOT a tagged tuple) | `@unboxed Str(string) \| Arr(array<JSON.t>)` — the array arm is KEPT and the opaque element typed honestly as `JSON.t` (never faked as `array<string>`, never dropped to a bare scalar). Fixture: [`string-opaque-array`](../test/golden/cases/string-opaque-array). (#72) |
| `string \| Array<(Array<Cmd> \| [Cmd, number] \| [Cmd, number, number] \| …)>` — a union whose arms are **tagged tuples** `[string-literal head, …number]` and/or `Array<literal>` (Highcharts `SVGAttributes.d` = `string \| SVGPathArray`) | `@unboxed Str(string) \| Arr(array<Seg.t>)` where `Seg` is an OPAQUE MODULE with one zero-cost `%identity` view per arm — `external fromTupleN: ((cmd, float, …)) => t` (named by **arity**, since tuples are anonymous) and `external fromCmds: array<cmd> => t` for the `Array<Cmd>` arm. Each arm keeps its EXACT flat shape (`(#M, 10., 20.)` → `["M",10,20]`); construct-only (the prop is supplied). The `(cmd, array<float>)` tuple form is NOT used — a ReScript tuple `(#M, [10.,20.])` is the NESTED `["M",[10,20]]`, mismatching the flat path data. Detection requires a **string-literal tuple head**, so a numeric tuple (`[number, number]`) is untouched. Such a union is a **provably-bounded leaf** (literals + numbers, no nested records), so it's classified even **past `MAX_DEPTH`** — the depth bound (which truncates UNBOUNDED record graphs) is bypassed *only* for this bounded shape, so the deep Highcharts `d` gets the real module, not a truncated `array<JSON.t>`. Fixture: [`svg-path-array`](../test/golden/cases/svg-path-array). (#72 rule 2) |
| **self-recursive** union — `type ClassValue = string \| number \| ClassValue[]` (clsx) | a SINGLE finite `@unboxed Str(string) \| Num(float) \| Arr(array<JSON.t>)` — the self-recursion guard terminates the cycle at first re-entry as `JSON.t` (so the self `ClassValue[]` arm is `array<JSON.t>`), instead of unrolling once per `MAX_DEPTH` into a nested monster. Fixture: [`recursive-union`](../test/golden/cases/recursive-union). (#72) |
| `CSSProperties \| ((state: S) => CSSProperties)` (base-ui's state-dependent style; also the checker-resolved `CSSProperties \| (CSSProperties & ((state: S) => CSSProperties))` form) | `@unboxed type sStyle = Style(JsxDOM.style) \| Fn(s => JsxDOM.style)` — an **intersection arm with a call signature counts as the function** (at runtime the value IS a function). Fixture: [`callable-intersection-union`](../test/golden/cases/callable-intersection-union) |
| `Record<string, V> \| Array<{ label, value: any }>` (Select's `items`) | `@unboxed type items<'a> = Dict(Dict.t<V>) \| ItemsConfigArr(array<itemsConfig<'a>>)` — a dict (object) and an array are runtime-distinct (`Array.isArray`). The element record's `value: any` becomes a generic `itemsConfig<'a>` threaded to the component — but **only** in a consumer-**SUPPLIED (input)** position (a prop, a method/constructor param). An `any` in a consumer-**RECEIVED (output)** position — a getter / method return (hono's `routes(): RouterRoute[]` whose `handler` returns `any`) — stays a flagged `string`, since an output-only `'a` unifies with anything (rule #4: a type var must round-trip). Also excluded: a plain record-field `any` (a state record consumed by `className`/`style`, per #31). Fixture: [`items-dict-array`](../test/golden/cases/items-dict-array). (#50) |

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
| `ReactElement \| ((props, state) => ReactElement)` (a `render` prop) | `React.element` (common case unchanged: `render={<Foo/>}`) **+ a zero-cost `renderFn` `%identity` wrapper** in the component module for the function form — `render={renderFn((props, state) => …)}` — typed with the signature's **exact** extracted types (e.g. `(PositionerSharedTypes.htmlProps, RootSharedTypes.accordionRootState) => React.element`); imperfect params salvage to type variables, an imperfect return drops the wrapper (note-only). An `@unboxed Element \| Fn` cannot compile: `React.element` is abstract, and untagged variants need each payload's runtime shape statically known. Fixture: [`fidelity-polish`](../test/golden/cases/fidelity-polish). (#34/#46) |
| `number \| null` value prop (e.g. controlled `value`) | `Nullable.t<float>` — passing `null` (controlled-clear) is distinct from omitting; recovered from the **syntactic** node (strictNullChecks is off), value-position primitives only. (#34) |
| `ComponentType<P>` / `FC<P>` / `FunctionComponent<P>` / `ComponentClass<P>` | `React.component<p>` | `P` becomes a generated props record; only when `P` classifies cleanly |
| `Element` | `Dom.element` | a real DOM node (refs, portal targets) |
| `Node` | `Dom.node` | broader than Element (covers DocumentFragment/Text/…) |
| `HTMLDivElement`, `HTMLInputElement`, … | `Dom.htmlDivElement`, … | specific DOM elements, no dependency |
| `RefObject<T>` / `Ref<T>` / `MutableRefObject<T>` | `React.ref<Nullable.t<Dom.element>>` | configurable via `refType` |
| `Ref<HTMLInputElement>` (concrete element arg) | position-dependent (#34, #98): in **component-prop position** → the generic `React.ref<Nullable.t<Dom.element>>` — the consumer must CREATE the ref, and ReScript JSX can only produce the generic one (`ReactDOM.Ref.domRef`), so an element-specific ref prop forced an `%identity` widening in every consumer; reads of the node don't need the specific element type. In **nested positions** (record fields, callback params — the read side) → `React.ref<Nullable.t<Dom.htmlInputElement>>` for specificity (a `HTMLElement \| null` arg strips null); falls back to `Dom.element`. |
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
| a React event TYPE in any position — `createStubAnchorClickEvent(): React.MouseEvent<…>` (return), or a field/param | `ReactEvent.Mouse.t` (etc.) — the same name→`ReactEvent.*.t` map, now reached from general `classify()`, not only `on*` handlers. Gated to `@types/react` decls, so a **DOM** `MouseEvent` (lib.dom) still maps to `Dom.event`. Fixture: [`fn-exports`](../test/golden/cases/fn-exports) (`makeClick`). (#83) |
| `(value: string, index: number) => void` | `(string, int) => unit` |
| `(e: Error) => void` (the global `Error`, lib.es) | `JsError.t => unit` — mapped to the stdlib JS-error type rather than degrading to a bare/unflagged `string` (in a shared record an `Error` param can't salvage to a component type variable). Guarded on a lib.es declaration so a package's own `Error` interface is unaffected. (#63 validation) |
| `() => void \| Promise<void>` | `unit => 'a` — polymorphic return covers sync **and** async |
| `(item: Unmodellable, label: string) => void` (callback PARAM can't be typed, return is clean) | `('a, string) => unit` **+ ⓘ note** — the bad param becomes a type variable (consumer RECEIVES it, so a hole they annotate is honest) instead of dropping the whole prop to `string`. A callback with an unmodellable **return** is NOT salvaged (a fake return feeds wrong values into the library) and stays flagged. Fixture: [`callback-param-salvage`](../test/golden/cases/callback-param-salvage). (#30 I-1a) |
| `(reason?: boolean \| string) => void` (**optional** param) | `option<boolOrString> => unit` — an optional param becomes `option<…>` (`None` = omitted), never a required arg. |
| `(item: string \| null) => void` (callback PARAM `\| null`) / `(row) => Row \| null` (single-typed nullable RETURN) | `Nullable.t<string> => unit` / `row => Nullable.t<row>` — `\| null` on a callback boundary is kept (recovered from the syntactic node, strictNullChecks-off strips it): a param the library passes must let the consumer handle null, and a single-typed nullable return (collapsed from a union) the consumer must be able to produce. Fixture: [`callback-nullable`](../test/golden/cases/callback-nullable). (#63 validation) |
| `children: string \| number` (own, narrowing an inherited `children?: ReactNode`) | `~children: CommonTypes.stringOrNumber` — the merge resolves to `ReactNode & (string \| number)`, which TS distributes to `string \| number \| (ReactElement & string) \| …`; the `<reactType> & <primitive>` parts are uninhabitable distribution artifacts, so the real (narrowed) type `string \| number` wins over the lossy `React.element`. A genuine `children?: ReactNode` (a plain `ReactElement` part) stays `React.element`. Fixture: [`narrowed-children`](../test/golden/cases/narrowed-children). (#64) |
| `((reason?: …) => void) & ((e: MouseEvent) => void)` (overload = intersection of call sigs, or a multi-call-signature interface) | an **opaque module with one zero-cost `%identity` accessor per signature** — `module CloseToastFunc = { type t; external asReason: t => (option<boolOrString> => unit) = "%identity"; external asMouse: t => (ReactEvent.Mouse.t => unit) = "%identity" }`; the prop is typed `…CloseToastFunc.t` with an `ⓘ` note. **No overload is dropped.** Falls back to 🔍 review only if a signature has an untypeable param. See [`overload-intersection`](../test/golden/cases/overload-intersection). |
| `onClick?: (event?: React.MouseEvent) => void` merged with an inherited `MouseEventHandler` (Button) | a plain callback `option<ReactEvent.Mouse.t> => unit`, **not** an opaque overload module — a multi-call-signature type that is really one FIRST-PARTY signature plus an inherited one (or one declaration's optional-param expansion) is not a genuine overload. The first-party signature wins; a genuine overload (≥2 separate first-party declarations) still uses the views module above. (#65 B4) |
| `interface Translator { (key: string): string; locale: string; setLocale(l: string): void }` (**callable-with-properties** — i18next's `t`, framer-motion's `motion`, axios instances) | an **opaque module**: `module Translator = { type t; external asFn: t => (string => string) = "%identity"; @get external locale: t => string = "locale"; @send external setLocale: (t, string) => unit = "setLocale" }`. The `asFn` view is the sanctioned zero-cost `as*` accessor; `@get`/`@send` are runtime-real property reads/method calls. Previously the object side was **silently dropped** (bound as a bare `string => string`). An EXPORTED value of such a type binds as `external t: …Translator.t = "t"` (not a flattened function). A carried property that can't be typed is dropped from the module but **named in the ⚠️ note** — flagged, never faked. A self-returning method (axios' `create(): Client`) resolves to `t` through the registry. Function+namespace merges (clsx's `export=` shape) are NOT callable-with-properties — the namespace members emit separately and the root stays a plain function. Fixture: [`callable-with-properties`](../test/golden/cases/callable-with-properties). (#103) |

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
| `{a; b: string} \| {a; b: number}` — a union of ANONYMOUS object literals with an IDENTICAL key set (`useSkeletonBase`'s return) | **one merged record** over the arms (each field unioned across arms). Each anonymous `{…}` has its own `__type` symbol (so the same-generic-record collapse above misses them) and `isStructured` rejects `__type` objects, so it used to fall to `string`. Narrow gate (all anonymous objects + identical keys) so a mixed `number \| Partial<{…}>` is unaffected. Fixture: [`fn-exports`](../test/golden/cases/fn-exports) (`useThing`). (#83) |

---

## ARIA / role attributes
Fixture: [`aria`](../test/golden/cases/aria)

A **numeric** TS enum (`enum Orientation { vertical = 0, horizontal = 1 }`) or numeric literal
union emits **unquoted** `@as(0)` / `@as(1)` — the int runtime value. A string tag (`@as("0")`)
would silently mismatch the library at runtime (it compares against the number `0`). String-literal
members stay quoted (`@as("sm")`). Fixture: [`numeric-enum`](../test/golden/cases/numeric-enum). (#63)

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
Fixtures: [`html-attrs-component`](../test/golden/cases/html-attrs-component), [`html-attrs-omit`](../test/golden/cases/html-attrs-omit), [`html-attrs-collision`](../test/golden/cases/html-attrs-collision), [`html-attrs-no-match`](../test/golden/cases/html-attrs-no-match), [`shared-base-records`](../test/golden/cases/shared-base-records)

A component whose props intersect (or whose interface `extends`) a React attribute
interface — `ButtonHTMLAttributes<T>`, `InputHTMLAttributes<T>`, any `*HTMLAttributes`,
optionally wrapped in `Omit<…, K>` / `Partial<…>` — does NOT inline the attribute
surface as labeled args. It emits the **record-props form** with one shared spread.
Detection is **transitive** (#130): the attrs interface may arrive through package-local
aliases and nested `Omit<>` wrappers (blend's `Omit<BlockProps, 'children'>` where
`BlockProps = StyledBlockProps & Omit<React.HTMLAttributes<HTMLElement>, 'as'|'color'> & {…}`)
— omit keys compose across every layer, and interface heritage recurses through
package-local bases (a `React.` qualifier on the heritage name is stripped):

| TypeScript | ReScript |
|---|---|
| `OwnProps & ButtonHTMLAttributes<HTMLButtonElement>` | `type props = { ...HtmlAttrs.buttonHTMLAttributes, <own fields> }` + `external make: React.component<props>` |
| `OwnProps & Omit<ButtonHTMLAttributes<…>, 'style' \| 'className'>` | spread of a **narrowed variant** `HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle` — only the hierarchy slice containing the removed keys is re-materialized; aria + events stay shared. Variants are deduped by removed-set. |
| own prop colliding with a chain field (e.g. own `onClick: (v, i) => void`) | the own prop WINS with its own mapping; the base spread is narrowed (`…OmitOnClick`) so a duplicate-field compile error is impossible |
| `Base & Omit<BlockProps, 'children'>` — the attrs interface nested INSIDE `BlockProps`, behind a second `Omit` | the leaf is still found; the slice composes ALL layers' keys: `...HtmlAttrs.htmlAttributesOmitChildrenColor` (#130) |
| `& SVGAttributes<…>` / `& AllHTMLAttributes<…>` / non-literal `Omit` keys / generic component / `--file`/`--stdout` mode | **legacy labeled-args output** (unchanged) |

**Shared-base props records (#82).** A PURE package-local NAMED intersection part — an
alias/interface none of whose fields is vendor-declared (blend's `StyledBlockProps`, the
~95-field Block CSS surface; `BaseSkeletonProps`) — becomes ONE shared record in `*Types.res`,
spread by every consumer instead of being inlined per component:

```rescript
type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenColor,
  ...BlendTypes.baseSkeletonProps,
  ...BlendTypes.styledBlockProps,
  size?: skeletonSize,   // only genuinely own props stay inline
}
```

TypeScript dissolves nested intersections, so an intermediate alias (`StyledBlockProps`)
is recovered from the alias declaration's SYNTAX. A base spreads only when provably
collision-free (ReScript record spreads hard-error on duplicate labels): every base field's
flattened prop must resolve to the base's own property declarations — an `Omit<>` wrapper's
mapped symbols keep the original declarations, while a component-level redeclaration breaks
the containment and that base falls back to today's inline flattening (a shadowed base is
never a compile error). React/vendor wrapper types (`RefAttributes`, styled-components'
`ExecutionProps`, …) never spread — on real packages they're vendor-declared; the name-set
keeps self-contained fixtures behaving identically. A component whose props are ONE named
alias (no intersection) keeps the legacy inline form — a spread-only `props` would add
indirection with no dedup win.

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

## Discriminated-union props (`Base & (A | B | C)`)
Fixture: [`discriminated-union-props`](../test/golden/cases/discriminated-union-props)

A component whose props are a base intersected with a union of variant shapes —
`{ maxWidth?, … } & (DefaultCardProps | AlignedCardProps | CustomCardProps)` — distributes to
`(Base&A) | (Base&B) | (Base&C)`. TS's `getPropertiesOfType` on that union returns only the props
common to **every** arm (the base + any shared discriminant), so variant-specific props were
silently dropped — `Card` kept only `maxWidth`/`variant` and could render nothing.

The binding gathers the arm-specific props too: the union's common props keep their correctly-merged
types (e.g. the `variant` discriminant becomes one enum over all arms), and each prop that isn't in
**every** arm is added as **optional** (it applies only to its variant; ReScript can't express the
discriminated dependency, so flatten-optional is the faithful, compilable model — `~alignment` and
`~children`, required within their arm, surface as optional). (#63 C2)

---

## Records, recursion & utility unwrapping
Fixture: [`records`](../test/golden/cases/records)

| TypeScript | ReScript |
|---|---|
| anonymous `{ x: number; y: number }` at prop `point` in component `Avatar` | `type avatarPointConfig = { x: float, y: float }` — named by a **stable anchor**, never a registration-order counter. Prop/field names (`sm`, `value`, `completed`, `inputContainer`) recur across unrelated components AND at many distinct shapes inside one nested tree; a bare base collided into a global numbered series (`…Config2`/`…Config3`) numbered by **registration order**, so adding/removing an *unrelated* sibling renumbered a byte-identical type — source-breaking churn. Three anchors, applied in this order, decide the name (all known at registration → no post-build rename, so self/mutual refs stay intact): <br>① **property path** — the field chain that reaches the shape (`stepperStepCircleCompletedConfig` vs `stepperStepIconCompletedConfig`); a standalone function's anonymous return anchors to the function name. <br>② **owning named type** — a named type seeds its descendants with its OWN name, so blend's inline `inputContainer: {…}` declared in ~8 separate `*TokensType` records become `inputsTextInputTokensInputContainerConfig` etc. instead of one `inputsInputContainerConfig` + counter. <br>③ **discriminant tag** — each arm of a discriminated union (blend's `ColumnDefinition<T>`, 10 arms all at prop `columns`, tagged `type: ColumnType.TEXT…`) is named by its tag: `dataTableColumnsTextConfig`, `…NumberConfig`, …, not `…Config2`/`…Config10`. SCREAMING_SNAKE tags are lower-cased so `pascal` Title-cases them. <br>Together these take blend to **zero** numbered names (was 109). Fixture: [`stable-structural-names`](../test/golden/cases/stable-structural-names). (#90, #63 naming) <br>**Generalized to EVERY naming site (#96):** the same path-anchoring applies to anonymous literal-union **enums** (`color?: 'error' \| …` on sibling props → `dataTableTagColumnPropsColor` / `…ProgressColumnPropsColor`, never `color2`/`color3` — the blend-rescript#106 churn), the literal-open `…OrString` variants, function-bearing `@unboxed` variants, and **opaque-module** names — all via one shared `stableAnonBase` helper (home stem + property path), so future naming sites inherit the guarantee by construction. When a numeric suffix DOES fire (same base at the same anchor), the CLI prints a `⚠ counter-suffixed type name(s)` warning listing the surviving names — churn risk is visible at generation time, not at downstream upgrade time. Fixture: [`stable-enum-names`](../test/golden/cases/stable-enum-names). <br>**Residual eliminated by a finalization pass (#90 residual):** the remaining counters were genuinely *distinct* shapes sharing a base — either the same declared name in several files (blend's `SizeToken`/`StateToken`/`VariantToken` across components) or a generic alias instantiated with different args. A post-extraction `stabilizeNames` pass now retires the order-dependent counter: after the whole colliding set is known, each distinct shape gets a **per-shape intrinsic** suffix — the **home stem** when it distinguishes them (`variantTokenSingleSelectV2` / `variantTokenMenuV2` / `triggerStateTokenSingleSelectV2`), else a **content hash** of the shape. That hash is derived by `structuralSig` from STRUCTURE ONLY (field names/optionality + recursively the referenced types' shapes, cycle-guarded) — **not** from `type.id`: the id-based `entrySig`/`recordSig` embed the checker's `type.id` through ref keys, and `type.id` is assigned in encounter order, so before this an unrelated upstream edit OR a compiler-version bump renumbered it and the "stable" hash churned (`sizeTokenConfig3` ⇄ `sizeTokenConfig`) — the original #90 defect. The structural hash is a pure function of the shape, so an identical shape gets an identical hash across versions/edits (verified: blend generates byte-identical type names on TypeScript 5.9 and 6.0.3; smoke-guarded by a renumber-invariance check). `structuralSig` also carries a referenced entry's stable anchor **base** and a broken/opaque field's original **TS type text**, so two records distinguishable ONLY through broken-typed fields (base-ui's `rootMenuStore…` vs `triggerMenuStore…`, both `→string`) hash apart instead of colliding. **Precisely:** *identical shape ⇒ identical hash*; if two genuinely-DISTINCT shapes still land on the same hash (a ~1-in-60M FNV collision), the colliders are **sorted by their structuralSig** before the counter is assigned, so even that tiebreak is order-independent — an unrelated upstream edit can't permute it. The one residual: two entries with a *byte-identical* structuralSig (identical base + fields + referenced shapes + broken-field text) sort equal and the counter between them is order-dependent — a vanishingly narrow case for deep internal types, not the general guarantee. A base used by ONE shape keeps its bare name, so non-colliding names (base-ui's `baseUIEvent`) are untouched; shapes that converged to identical after healing are merged. The rename is applied at emit's single `resolveRef` chokepoint (translating each ref's cached name to the entry's final name), so keyless refs and every IR shape are covered without mutating the IR. This takes blend from **22 → 1** counter (the last is an opaque-union module, `ColumnDefinition`, whose `Module.t` refs need the translation extended — a small follow-up). The home-stem doubling check is **per-entry (#115)**: an entry whose base already carries ITS OWN home stem stays bare, but a *collider's* coincidental stem prefix no longer forces a hash — `SelectMenuGroup` in `Select` vs `SingleSelect` was hashed just because the base starts with `select`; now `SelectTypes.selectMenuGroup` (bare) + `SingleSelectTypes.selectMenuGroupSingleSelect` (semantic). Fixtures: [`stable-name-collision`](../test/golden/cases/stable-name-collision) (same-home → hash), [`cross-home-name-collision`](../test/golden/cases/cross-home-name-collision) (semantic). (#90 residual, #115) |
| named `interface MenuItemType { … }` | `type menuItemType = { … }` — a NAMED library type keeps its own name (no home prefix), per the "follow the library" rule. (#62) |
| self-referential `{ subItems?: MenuItemType[] }` | `type rec menuItemType = { subItems?: array<menuItemType> }` (`rec` **only** when genuinely recursive) — a DIRECT self-reference resolves even when the record is first reached past `MAX_DEPTH` (the depth bound truncates unbounded NEW expansion, but a self-ref is a zero-expansion cycle to the record itself; truncating it to a silent `string` degraded e.g. `SingleSelectV2ItemType.subMenu` while the shallower `MultiSelectV2ItemType` stayed recursive). (#63 validation) |
| `interface EmptyState {}` (empty object) | `JSON.t` — a real object arrives at runtime but has no modellable fields (the `unknown` precedent). Fixture: [`empty-state-and-salvage`](../test/golden/cases/empty-state-and-salvage) |
| `Partial<BaseProps>` | record with all fields optional (utility unwrapped: `Partial`/`Required`/`Readonly`/`Pick`/`Omit`/`NonNullable`) |
| `interface X extends HTMLAttributes<…>` | `type … = { ...JsxDOM.domProps, <own fields> }` |
| nested record `interface ItemData extends <HTML attrs> { id: string \| number; size?: … }` | first-party fields whose names collide with DOM attrs (`id`, `size`, …) are KEPT with their real types — `{ id: CommonTypes.stringOrNumber, size?: …, … }`. `...JsxDOM.domProps` is all-or-nothing (can't omit a field like the component path's HtmlAttrs variants), and ReScript rejects a field overlapping a spread, so on collision the named fields win and the spread is dropped (rather than silently dropping the fields). Fixture: [`record-html-collision`](../test/golden/cases/record-html-collision). (#63 C3) |
| nested data record `{ key: string; color: string }[]` | `type … = { key: string, color: string }` — `key`/`ref` are React-reserved **only** on a component's top-level props (stripped there); inside a nested DATA record they are real payload and are KEPT. Fixture: [`data-record-key`](../test/golden/cases/data-record-key). (#63 C1) |
| `data: Row[] \| null` (required) | `data: Nullable.t<array<row>>` — `T \| null` recovers to `Nullable.t<T>` for **any** single `T` (array/record/primitive), not just primitives; dropping `\| null` to a required non-nullable type flips required-ness. Applies to record fields **and** component props. Fixture: [`nullable-fields`](../test/golden/cases/nullable-fields). (#63 C5) |
| `span: string \| number \| null` (MULTI-type union + null) | `Nullable.t<[#String(string) \| #Number(float)]>` — a multi-arm union with `\| null` is wrapped too (props and callback params/returns — Drawer snap-points), not just a single `T \| null`. Skipped for opaque-module / views refs (`Anchor.t`): their null arm is the module's own `none`/`from*` concern. Fixture: [`nullable-fields`](../test/golden/cases/nullable-fields). (#65 B2) |
| `note: string \| undefined` (required decl) / `caption: Props['x']` (indexed access into an optional **first-party** prop) | optional field/prop (`note?`, `~caption: …=?`) — a `\| undefined` (or an indexed access into an optional source prop) means the value can be omitted. strictNullChecks is off, so recovered from the syntactic node / the source prop's optional flag. **Only a first-party source counts**: `fontSize: CSSObject['fontSize']` stays REQUIRED — csstype/styled-components mark every CSS property optional by convention, so that optionality isn't meaningful (it would wrongly drop ResponsiveText's required `fontSize`/`color`). For a MERGED property (own + an external base signature), the optionality/type come from the single **first-party property signature** — so `value: number \| undefined` (UnitInput, merged with `@types/react`'s `value?: string\|…`) becomes optional via its own `\| undefined`, while `title: string` (merged with `@types/react`'s `title?`) stays required. Fixture: [`nullable-fields`](../test/golden/cases/nullable-fields), [`merged-required-prop`](../test/golden/cases/merged-required-prop). (#63 C5 / #64 / #65 B1) |

In module mode these live in per-domain `*Types.res` modules, deduplicated by type identity and
referenced qualified (`MenuTypes.menuItemType`); cyclic groups merge via SCC into one module
named after the SCC's **largest member** + `SharedTypes` (e.g. `PositionerSharedTypes`) — NOT every
member concatenated. This keeps merged-module names short and, crucially, **stable**: adding or
removing a small domain from the cycle doesn't rename the module, so consumers' qualified references
(`PositionerSharedTypes.foo`) survive a regeneration. (#35)

**Structural dedup is scoped per home module.** Distinct TS types that widen to the same record
shape collapse to one (e.g. Hono's 1728 `honoNNN`) — but **only within the same home module**. An
anonymous `{…}` has no declaration file, so it's homed to whichever component builds it first;
merging identical inline shapes *across* components (Avatar's `sizeConfig` ≡ DataTable's) pinned the
canonical to that arbitrary home and drew a processing-order cross-edge. With dense cross-references
that fused **58 of 77** component modules into ONE artificial SCC (`HighchartsSharedTypes` held
2409/2578 types for `@juspay/blend`). Keying the dedup by `home|sig` keeps the within-module collapse
(Hono shares one home; component files stay compact) while a shared shape gets its own copy per
component — types stay in the module the library declares them in, and only **genuine** mutual
recursion merges. A named library type is never structurally merged with a *differently-named* one.
Fixture: [`cross-component-dedup`](../test/golden/cases/cross-component-dedup). (#61)

**Sink modules stay dependency-free and are never SCC-merged (#115 pkg).** `CommonTypes`,
`InstanceTypes`, `WebTypes` are dependency-free sinks (shared primitives, class instance types, web
types) — every other module may reference *into* them, but they must have zero out-edges so each is
always its own module. A synthetic type (opaque union / overload / `@unboxed`) with no TS source is
homed by its first dependency; it now prefers the first **non-sink** dep, so a union like
`(string \| number) \| (string \| number)[] \| PointOptionsObject` (deps `[stringOrNumber (Common),
pointOptionsObject (Highcharts)]`) homes in `HighchartsTypes`, not `CommonTypes`. Without this, that
one mis-homed variant drew a `CommonTypes → HighchartsTypes` out-edge that closed a spurious cycle
and made Tarjan fuse `CommonTypes`/`ButtonTypes`/`ChartsTypes` into `HighchartsSharedTypes`
(89/286 importers) — deleting those modules and breaking every downstream `CommonTypes.stringOrNumber`
ref. `planSharedModules` also structurally skips sink out-edges and flags (never silently merges) any
sink pulled into a cycle. Fixture: [`sink-no-merge`](../test/golden/cases/sink-no-merge). (#115)

**Callable-module placement sees prop-derived deps; ref homes are late-bound (#128).** A
callable-with-properties module whose call signatures are dep-free but whose carried props reference
another module (axios-style `defaults: Config` where the `(url) => Promise<string>` call side touches
nothing) **co-locates with its prop deps**: the #115 non-sink home pick re-runs after carried-prop
classification with the complete dep set (excluding the SELF dep a `create(): Client` method adds, so
it can't out-vote the real ones). Re-homing after the entry has registered is safe because a keyed
ref's home is resolved **through the registry at render time** (`makeResolveRef` looks the entry up by
`ref.key`) rather than trusting the mint-time copy — refs minted *during* prop classification (the
recursion cache for self-returning methods, records referencing the module) can never strand on a
stale home. Placement-only: the dep/SCC graph was already complete either way. BOTH callable home
picks (the sig-derived one and the post-prop re-pick) re-home only to a genuine **non-sink** dep: a
callable whose deps are ALL sink-homed — whether from a prop (`size: string | number`) or from the
SIGNATURE itself (`(x: string | number) => …`), both resolving to `stringOrNumber` in CommonTypes —
keeps its OWN module rather than sinking a `module <Name> = {…}` into a primitive sink. CommonTypes
stays the leaf for primitive unions. (Overloads without carried props keep the legacy pick.)
Fixtures: [`callable-home-prop-deps`](../test/golden/cases/callable-home-prop-deps),
[`callable-sink-only-home`](../test/golden/cases/callable-sink-only-home). (#128)

**No generated type shadows a builtin.** An upstream interface named `Array`/`Option`/… lowercases
to `array`/`option`; emitted bare it would shadow the ReScript pervasive within its module, so
`array<string>` fails to compile ("the type array is not generic"). `uniqueName` suffixes a base that
collides with a pervasive (`array` → `array2`, `option` → `option2`) exactly as it does a name clash.
Fixture: [`cross-component-dedup`](../test/golden/cases/cross-component-dedup). (#61)

**Deep-record healing.** A record first reached at the `MAX_DEPTH` boundary registers, but its
fields (one level deeper) overflow the budget and all come back opaque — an all-`string` "ghost"
(`setOpenConfig2` with `cancel: string`). A post-extraction pass re-resolves any mostly-fallback
record at depth 0 and keeps the result **only when it introduces zero new registry entries** — so a
genuine small config (whose field types were already registered by a shallow-resolved twin) heals to
its real types (`cancel: unit => unit`), while an unbounded library graph (Highcharts options) would
register hundreds of new entries, gets rolled back, and stays safely truncated. Locked by base-ui's
`setOpenConfig2` in the benchmark baseline (the depth boundary is too fragile to pin in a synthetic
golden).

**`~ref` synthesis for forwardRef surfaces (#98).** A component typed
`ForwardRefExoticComponent<P & RefAttributes<R>>` gets a synthesized `~ref` prop — the `ref` symbol
is React-reserved and filtered from the props, but the JSX v4 ppx accepts and forwards a `~ref`
labeled arg on an external (verified: `ref` lands in the JS props object, which is exactly what a JS
forwardRef component needs). The payload decides the type: a DOM element → the generic constructable
`React.ref<Nullable.t<Dom.element>>`; a cleanly-modelled imperative handle →
`React.ref<Nullable.t<handle>>` (highcharts-react's `HighchartsReactRefObject`; the consumer creates
it with `React.useRef(Nullable.null)` and reads the typed handle back). Gated syntactically on the
React ref family (`Ref`/`RefObject`/…) and skipped when the payload can't be modelled cleanly
(flag-don't-fake). Fixture: [`forwardref-ref-prop`](../test/golden/cases/forwardref-ref-prop). (#98)

**`this`-typed callbacks → `@this` (#98).** `(this: Point, tooltip: Tooltip) => string` (Highcharts'
formatter family) binds as `@this ((point, tooltip) => string)` — the first param binds the JS `this`
the library invokes the function with. The `this` parameter was previously dropped silently, so the
emitted callback type-checked but couldn't reach the value it's about. The `this` type is classified
like a param (library-produced); if it can't be modelled the whole prop stays flagged. Fixture:
[`this-typed-callback`](../test/golden/cases/this-typed-callback). (#98)

**Leaf types resolve past `MAX_DEPTH`; degraded record fields are flagged (#98).** The depth bound
exists to truncate *unbounded new expansion* — but a primitive cannot expand anything, so a leaf
first reached past the bound resolves exactly: `string`/`number`/`boolean`/`bigint`/`unknown → JSON.t`/
`keyof → string`/csstype values, with literals folding to their base primitive (past the bound the
alternative was an opaque `string` anyway). Before this, a record first reached past `MAX_DEPTH`
(Highcharts' `TooltipOptions`) froze **every** field as `string` — `enabled?: boolean` included. The
fields that DO still degrade (deep objects, callbacks like `formatter?: TooltipFormatterCallbackFunction`)
now carry the same flag comments props get (`⚪ loose — was …` / `⚠️ REVIEW` / `🛑 BROKEN — contains any`)
instead of being silent — record fields render structurally (a field's shape is often partly right), so
only the trailing comment is added. Two zero-expansion escapes extend this: a reference to an
already-**registered** record entry links (`refTo`) even past the bound — the self-ref exception
generalized; the entry exists (names register before fields build), so no new registry growth is
possible — and a **function** type classifies through its signature (its params/return each link,
resolve as leaves, or truncate flagged; self-recursive function types are visiting-guarded). The
linked entry may be **generic** and may be an **in-progress ancestor** reached from a record FIELD
(#115): Highcharts' `chart<'b>.options` is `options<'b>` (an already-registered generic record still
being built via the `options → series → chart → options` cycle) — it now links and the cycle lands
in one `type rec chart<'b> = {…, options?: options<'b>} and options<'b>` group (the emitter already
emits generic `type rec` groups like `zAxisOptions<'b>`; `syncRefTparams` threads the `<'b>`). This
recovers `chart.options` / `chart.addSeries` from a loose `string` — the earlier non-generic /
function-signature-only restrictions predated `syncRefTparams` and the record↔module cycle break.
Still record-only: an opaque-module/views entry can't be linked past-depth (its `Module.t` would
reference a file that never emits). Net effect: `TooltipOptions.formatter` emits a real
`@this ((point<'b>, tooltip<'b>, option<point<'b>>) => string)` instead of an opaque `string`.
When such linking creates a genuine record ↔ views-module cycle, the emitter breaks it with a
**forward-declared abstract type**: `type moduleName_t` hoisted above the `type rec` group, fields
reference it, and the module aliases it (`type t = moduleName_t`) — zero-cost, consumers still use
`Module.t`/`Module.from*`. Fixtures: [`deep-record-leaves`](../test/golden/cases/deep-record-leaves),
[`this-typed-callback`](../test/golden/cases/this-typed-callback) (`Widget` cycle),
[`deep-generic-selfref`](../test/golden/cases/deep-generic-selfref) (`chart.options` in-progress link). (#98, #110, #115)

**Bounded records/unions materialize past the bound (#115 item 1).** A type FIRST reached past
`MAX_DEPTH` (never registered) used to truncate to `string`. Now, when it is **provably bounded** —
`boundedPastDepth`: every field a leaf / already-registered link / container / function / bounded
sub-record within a small nesting budget, cycle-guarded — it materializes instead of truncating:
(a) a **NAMED bounded record** becomes a real record (Highcharts' `xAxisOptions.labels` →
`xAxisLabelsOptions<'b>`; `yAxis` already resolved shallowly) — NAMED only, so an anonymous `{…}`
can't proliferate order-churny `…Config2/3` names; (b) a **past-bound UNION** whose arms are all
bounded is split through `unionNode` instead of truncated wholesale — `tooltipOptions.shadow`
(`boolean | ShadowOptionsObject`) → `@unboxed Bool | ShadowOptionsObject`, `seriesXrangeOptions.dataLabels`
(`A | A[]`) → `@unboxed One(a) | Many(array<a>)`, `tooltipOptions.style` (`CSSObject | TooltipStyleOptions`)
→ an opaque-module views union; (c) `memberOf` expands a **bounded NAMED object union arm** (the
anti-graph-pull exclusion is lifted only when bounded). A budget cap + cycle guard keep the unbounded
Highcharts graph bounded. This depended on stable naming (#90) — before it, materializing deep records
renumbered 100+ unrelated names; now every benchmark package compiles with equal-or-better metrics.
Fixture: [`deep-union-arms`](../test/golden/cases/deep-union-arms). (#115 item 1)

**Registration-order re-link past the bound (#120).** A NAMED record reached past `MAX_DEPTH` and *not
bounded* (or past the materialize budget) still truncates to `string` — but the SAME type is often
registered by a **shallower** site elsewhere (Highcharts' `SeriesEventsOptionsObject`: ~119 series
reach `events` shallowly and materialize `seriesEventsOptionsObject`, but ~118 reach it past-depth
*before* that and got `string`). The truncation now stamps the TS `type.id` (`relinkId`) on the
opaque node; a post-extraction `relinkRegistered` pass (runs before `propagateTypeParams`, walks every
IR tree) re-resolves each such field to the now-registered record — a **zero-expansion** link (the
entry already exists), so it's order-independent and never enlarges the graph. The new edge is added
to the owning entry's `deps` so `planSharedModules` homes/orders the target correctly. A `relinkId`
that never registers is dropped → the honest `string` fallback stays. Effect on blend: `events`,
`dataGrouping`, `dragDrop`, … go from `string` to their real records; all other packages
byte-identical. Fixture: [`relink-registered`](../test/golden/cases/relink-registered). (#120)

**Twin healing (depth ghost ↔ shallow full sibling).** When the re-resolve above can't run because the
shape's sub-types are a *distinct* generic instantiation (csstype gives `CSSObject['color']` vs
`['backgroundColor']` different type ids, so `MenuV2VariantToken<StateToken<…>>` isn't deduped across
them), a deep occurrence still truncates to an all-`string` ghost while the SAME shape resolved fully at
a shallower site (`text.color` → `{ default: string, action: string }` vs `backgroundColor` →
`{ default: stateToken, action: menuV2ActionConfig }`). A second pass copies field types from a
structurally-richer **twin** — same name-family + home, same field names, non-fallback types — onto the
ghost. Safe: it copies already-materialized field types (no re-resolution, no new entries, no depth
change), so it can't dangle or re-expand the Highcharts graph (bumping `MAX_DEPTH` *does* — verified, it
breaks the chart compile). Locked by blend's `menuV2VariantToken` in the benchmark baseline (a >6-level
token tree is too fragile to pin in a synthetic golden). (#63 review)

**`@unboxed` inside a record cycle.** A field like `labelGrid?: string | ((…, Options) => string)`
becomes an object-bearing `@unboxed`, and if its function arm references back into the record cycle
(`Labels → Options → Locale → Labels`) the `@unboxed` is genuinely part of the recursion. It can't be
a separate declaration (forward reference either way), so it's **folded into the `type rec … and …`
group** as `@unboxed and labelGrid = Str(string) | Fn(…)`. Fixture:
[`unboxed-in-record-cycle`](../test/golden/cases/unboxed-in-record-cycle).

**Type-parameter propagation across a cycle.** A genuine generic (`'a` — e.g. an input
`{ value: any }[]` element, #50) that enters a recursive group must reach **every** member that
transitively references it, even members with no type variable of their own. Records are built
bottom-up, so a cycle (`annotationControlPoint<'a> → events → annotation → options →
annotationControlPoint`) can reference a member **before** it has acquired its parameter — the
bottom-up pass then leaves an intermediary (`annotationEvents`) non-generic while it references the
now-generic `annotation<'a>`, emitting a bare `option<annotation>` that **won't compile** ("the type
constructor `annotation` expects 1 argument(s), but is here applied to 0"). A post-extraction
**fixpoint** closes the assignment: any entry that transitively reaches a parameterized member becomes
parameterized too (`annotationEvents<'a>`), and every reference is re-synced to its target's final
params (`option<annotation<'a>>`). No emitted type-constructor reference is ever left under-applied.
Fixture: [`recursive-type-param-cycle`](../test/golden/cases/recursive-type-param-cycle). (#61)

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
| **ERROR-`any`** — the checker's error type from an UNRESOLVABLE reference (blend's `import { ThemeType } from './tokens'` where the module doesn't export it) | **never** the implicit generic (that would silently fake the theming entry point as `~foundationTokens: 'a=?` with `defects=0`): a 🛑-flagged `string` placeholder whose comment names the broken-import cause, in props, function params/returns, record fields, and class members alike. The report's declaration column shows the failing reference (`ThemeType`) — the type usually EXISTS in the package, so hand-matching is a seconds-long fix. Author-written `any` is untouched. Detected via the checker's `error`/`unresolved` intrinsics, so a REAL `any` in the source never false-positives. Fixture: [`error-any-unresolved`](../test/golden/cases/error-any-unresolved). (#107) |

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

**Index-signature prop recovery (#92).** Props carrying a string index signature (`[key: string]: any`,
common in third-party libs — e.g. highcharts-react's `HighchartsReactProps`, so blend's `BlendChart` /
`ChartV2`) lose every NAMED property when wrapped in `Omit<…>`: TypeScript collapses
`Omit<{ [k:string]: any; options?: … }, "ref">` down to just `{ [k:string]: any }`. The component then
extracted only `ref`/`key` (both filtered) → **zero props → silently dropped as `no-props`**. Fix:
when the props type has a string index signature, recover the named props from the pre-`Omit` type
(`X` in `Omit<X, K>`, minus the omitted keys `K`), so the component binds with its real surface
(`options` / `immutable` / `callback` / …, some `⚪ loose` where the vendor type is unmodellable)
instead of vanishing. Scoped to index-signature props, so ordinary components are untouched. Fixture:
[`forwardref-indexed-props`](../test/golden/cases/forwardref-indexed-props). (#92)

**Multi-signature components prefer the concrete signature (#84).** A styled-components export
(`IStyledComponentBase<…> & string`) exposes TWO call signatures: first the polymorphic
`as`-rebinding form (`<AsTarget, ForwardedAsTarget>(props)`), whose visible props are only the
styling plumbing — `theme`/`as`/`forwardedAs`/`style` — as giant unresolved conditional types; then
the concrete zero-typeparam forwardRef form carrying the component's real props. Reading `sigs[0]`
bound the plumbing and dropped every functional prop (`children` included) — blend's 8 `Styled*`
exports emitted 4 loose strings each and nothing else. When several signatures exist, the one with
parameters and **no type parameters** is preferred; a single-signature generic component
(`VirtualList<T>`) is untouched. Fixture:
[`styled-concrete-signature`](../test/golden/cases/styled-concrete-signature). (#84, #98)

The recovery is **recursive** (#98): the collapse compounds through every `Omit` layer, so
`Omit<Omit<Poisoned, 'className' | 'style'> & Extra, 'ref'>` (blend's `ChartV2` — an inner `Omit`
inside an intersection, wrapped by the standard forwardRef `Omit<…, "ref">`) is descended layer by
layer — each `Omit` unwrapped with its keys accumulated, still-poisoned intersections split into
arms — and the named props are read only off leaf types, where no mapped type has been applied. All
accumulated omit keys are subtracted, so `className`/`style` stay excluded while the seven real
members survive. Fixture: [`forwardref-nested-omit`](../test/golden/cases/forwardref-nested-omit). (#98)

---

## Opaque-module unions
Fixtures: [`opaque-modules`](../test/golden/cases/opaque-modules), [`webapi`](../test/golden/cases/webapi), [`overload-intersection`](../test/golden/cases/overload-intersection), [`vendor-views`](../test/golden/cases/vendor-views), [`literal-run-collapse`](../test/golden/cases/literal-run-collapse)

When a union can't be an `@unboxed` variant — **multiple object shapes**, or **object | array<object>**
(abstract members that `typeof`/`Array.isArray` can't split into a recognized variant shape) — it
becomes an opaque-type module: an abstract `t` plus zero-cost `%identity` `from*` constructors.

**Every structured arm also gets its inverse `as*` READER (#122).** A module that only had `from*`
writers was write-only — you could put a `seriesLineOptions` into `options.series` but never read one
back (`chartsOptionsSeries_t` is abstract), blocking consumers that inspect/transform existing options
(the portal's `mapOutages` reads `.name`/`.data` off each series). So each record/callback/tuple/named
arm now emits a symmetric `external as<X>: t => armType = "%identity"` alongside its `from<X>`. It's the
zero-cost reverse view (value passes through unchanged), an **allowed `as*` form**; the caller
discriminates on the union's runtime tag for arm-SPECIFIC fields, while fields common to every arm are
always safe. Literal/tag/`unit` arms get no reader (the value IS its own runtime tag). Symmetric with
the overloaded-function module, which was already reader-based.

Three member forms beyond plain `from*` constructors (#39):

| Union member | Module arm |
|---|---|
| a string LITERAL (`'clipping-ancestors' \| Element \| Rect`) | a ready-made constant via a single-value polyvar cast — `external fromClippingAncestors: [#"clipping-ancestors"] => t` + `let clippingAncestors: t = …`. The polyvar admits exactly that one value (it IS the string at runtime), so no open string cast leaks in |
| a LARGE run of string literals (≥ 4 — React's `ElementType`/`keyof JSX.IntrinsicElements` expands to ~170 tag names) | ONE polyvar constructor `external fromTag: [#"a" \| #"div" \| …] => t` instead of ~2N constant lines. Same exactness (admits exactly that set, leak-free), ~85% smaller. A small set (< 4) keeps individual named constants. (#53) |
| `null` / `void` in a **callback return** | `let none: t = fromUnit()` — `unit`'s runtime value IS `undefined` |
| any member carrying an inner imperfection | the WHOLE module is rejected (deep `irHasImperfection` check) — no unflagged `=> string` fake can hide inside a view |
| two arms that produce the **same constructor ident** (`'trap-focus'` vs `'trapFocus'`, or two anon functions) | the WHOLE module is rejected → prop stays flagged (all-cases-or-flag: never silently drop a variant) |
| an anonymous (`__type`) function / array element | named `Fn` / derived from the element's record name — the TS-internal `__type` symbol never leaks into a `from*` constructor |

**Direction matters (construct-only views are produce-position-only).** A views module exposes `from*` constructors but no `as*` accessors, so it is only sound where the value is CONSUMER-produced (a prop, or the return of a consumer-provided callback). For a value the library PRODUCES — a callback PARAM — a construct-only module would be an uninspectable black box, so those positions keep the honest `'a` type-variable salvage / review flag instead. Polarity flips at each function boundary and is tracked through nested callbacks. Locked by [`views-polarity`](../test/golden/cases/views-polarity).

**Return-position views (`<Prop>Target`).** A callback **return** union that can't be discriminated
(`(closeType) => boolean \| HTMLElement \| null \| void`) becomes a construct-only views module —
`FinalFocusTarget.fromBool / fromHTMLElement / none`. Returns are CONSUMER-produced, so construct-only
is complete coverage in that direction (an explicit `\| null` is recovered from the syntactic return
node, since strictNullChecks-off absorbs it). This unlocks the enclosing `@unboxed Bool \| Ref \| Fn`
with an exact `Fn(interactionType => FinalFocusTarget.t)` arm.

**Vendor-record trial.** A dependency-declared object type the library gate refuses (`@floating-ui`'s
`Rect`/`VirtualElement` — small, stable, consumer-CONSTRUCTED shapes an opaque sink could not serve)
gets one sandboxed extraction attempt with a fresh depth budget: accepted **only** if every field of
every pulled entry is imperfection-free and the entry count stays bounded (≤8); anything less rolls
back fully and keeps the honest flag (`Tainted` in the fixture proves the rejection path). Platform
surfaces (lib.*, `@types`, `csstype`) never qualify.

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
so the optional can be omitted. A homogeneous final rest parameter (`...args: T[]`) is different:
it stays an `array<T>` on the ReScript side and the external gets `@variadic`, so the compiler spreads
the array into separate positional JavaScript arguments. It is never emitted as one optional labeled
array. A heterogeneous rest tuple is explicitly skipped because `@variadic` requires one homogeneous
element type. For a standalone function that skips the export; for a class it skips and reports only
the unsupported constructor/method while retaining the abstract type and every usable sibling. The JS
export name stays in the `= "…"` string, so a reserved or capitalized name still binds. Params and the
return reuse the same `classify` pipeline as component props, so named types land in the shared
`*Types.res` (referenced qualified). Fixture:
[`rest-parameters`](../test/golden/cases/rest-parameters). (#105)

| TypeScript export | ReScript |
|---|---|
| `function add(a: number, b: number): number` | `@module("pkg") external add: (float, float) => float = "add"` |
| `function now(): number` (zero args) | `@module("pkg") external now: unit => float = "now"` — an external can't take no args |
| `function forEach(items: number[], fn: (v: number, i: number) => void): void` | `external forEach: (array<float>, (float, float) => unit) => unit = "forEach"` |
| `function greet(name: string, greeting?: string): string` | `external greet: (string, ~greeting: string=?, unit) => string = "greet"` (optional → labeled `=?`) |
| `function collect(...items: string[]): string` | `@variadic external collect: array<string> => string = "collect"` — `collect(["a", "b"])` compiles to `collect("a", "b")`, not `collect(["a", "b"])` |
| `function format(prefix: string, ...values: number[]): string` | `@variadic external format: (string, array<float>) => string = "format"` — fixed prefix preserved, final array spread |
| `const translate: (p: Point, dx: number, dy: number) => Point` | `external translate: (PkgTypes.point, float, float) => PkgTypes.point = "translate"` (named `Point` → shared record) |
| `const renderThing: (a: Point, b: Point) => JSX.Element` | a **function**, not a `@react.component` — a React FC takes 0 or 1 (props) arg, so a **multi-arg** callable (even one returning JSX) binds as a function and keeps **every** arg. (#63 C4) |
| `const getSlots: (item: Item) => [ReactNode?]` | a **function** — a React element must **be** the return, not merely appear inside a **tuple/array** (`[ReactNode?]`, `ReactNode[]`); such a data-returning util is not a component. (#63 C4) |
| `const ThemeContext: React.Context<ThemeValue>` | `external themeContext: React.Context.t<themeValue> = "ThemeContext"` — a context VALUE, not a faked `@react.component`. React 19 makes a context renderable (element-returning call sig), but the export is a Context object (`<Ctx.Provider value=…>` / `useContext`). Fixture: [`react-context`](../test/golden/cases/react-context). (#63 C6) |
| `declare const FOUNDATION_THEME: FoundationTokenType` (a plain exported const VALUE, no call signature) | `external foundationTheme: TokensTypes.foundationTokenType = "FOUNDATION_THEME"` — a typed value binding through the same shared type registry (the constant's type is the SAME canonical record other bindings consume). Previously such exports fell into the silent "skipped non-component" bucket. Literal const types fold to their base runtime type (`DEFAULT_AVATAR_ALT = "Avatar"` → `string`, `MAX_INITIALS_LENGTH = 2` → `float`, readonly literal tuples → `array<…>`) — the folding is scoped to the const-value path, so a plain literal in a prop/record still keeps its `⚪ loose — was "x"` flag. An **enum MEMBER** (`Size.Sm`, `Mode.A`) is flagged `StringLiteral`/`NumberLiteral` by TS AND `EnumLike`; it is NEVER folded (guarded by `!EnumLike`), so it keeps its generated enum type instead of collapsing to `string`/`float`. Fixture: [`enum-member-literal`](../test/golden/cases/enum-member-literal). **Only a cleanly-modelled type binds** (flag-don't-fake): a constant whose type is opaque/`any`/unresolvable stays skipped (`value-not-modellable`) — and its `any` never generalizes to an output-only `'a` (a const is library-produced/consumer-received; rule #4). A **SCREAMING_SNAKE** name camelCases for the ReScript id (`DEFAULT_POSITION` → `defaultPosition`; the JS name stays in `= "…"`). Gated on `SymbolFlags.Value`, not `valueDeclaration` — a cross-file re-exported **default** const de-aliases to a symbol with no `valueDeclaration`. Fixture: [`const-value-export`](../test/golden/cases/const-value-export). (#105, #108) |

Same buckets apply: a param/return that can't be typed exactly falls back to the flagged placeholder
with a leading `// ⚪ loose` / `// ⚠️ REVIEW` / `// 🛑 BROKEN` comment above the binding (flag-don't-fake).
Bare type-alias/interface exports with no value reference are **not** bound yet — they're still
reported as `skipped` (planned as a later milestone).

**Default exports** ([`default-export`](../test/golden/cases/default-export)) bind the JS name
`= "default"` (the ReScript id keeps the declaration's own name, e.g. `greet`), and carry a flag:
a package that does `module.exports = fn` (plain CJS) exposes the value as the module itself, so
`require("pkg").default` is undefined — the consumer must verify that case at runtime.

**CommonJS `export = value` assignments** are resolved through TypeScript's external-module symbol,
not only `getExportsOfModule`. The latter exposes a callable's merged namespace members (or a
class's `prototype`) but omits the assigned root value — previously `export = cx` emitted only
`cx.bind`, while `export = Counter` emitted nothing and the CLI exited 1. A distinct
`checker.resolveExternalModuleSymbol(moduleSymbol)` result is now processed as a synthetic
`export=`/default entry **after** the ordinary members: callables reuse the standalone-function path,
classes reuse the `type t` + `@new`/`@send`/`@get` path, and merged namespace members still emit once.
The ordering is load-bearing: when a merged namespace member shares the root's name (the real clsx
shape — `module.exports = e; module.exports.clsx = e`), the member's real JS name (`= "clsx"`) works
under both CommonJS and ESM targets, while the root's `= "default"` is `undefined` under a CommonJS
target (`require("clsx").default`). The named member therefore wins the dedup, and the
interop-dependent root binding is emitted only when no same-named member exists. The default/CJS
runtime caveat remains visible above a root binding. Fixtures:
[`export-equals-callable`](../test/golden/cases/export-equals-callable),
[`export-equals-class`](../test/golden/cases/export-equals-class),
[`export-equals-merged-callable`](../test/golden/cases/export-equals-merged-callable). (#102)

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
labeled. A trailing optional gets a `unit` sentinel, the standard ReScript pattern. A homogeneous
final rest array becomes a positional final parameter with `@new @variadic` or `@send @variadic`,
using the same JS calling-convention rule as standalone functions. If one class member instead has an
unsupported tuple rest (common in typed event emitters such as `emit<K>(event, ...args: Events[K])`),
only that member is omitted and added to the skipped list; the constructor/type/sibling methods still
emit. An unsupported constructor similarly omits `make` but retains the class type and methods.

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
| `append(separator: string, ...values: string[]): string` | `@send @variadic external append: (t, ~separator: string, array<string>) => string = "append"` |
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
| `File` | `Webapi.File.t` | `WebTypes.file` (module mode — abstract, passable) or ⚪ flagged `string` (single-file) |
| `FileList` | `Webapi.FileList.t` | `WebTypes.fileList` / ⚪ `string` |
| `FormData` | `Webapi.FormData.t` | `WebTypes.formData` / ⚪ `string` |

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

## Compound-component statics (`Menu.Item`, `Select.Option`)
Fixture: [`compound-component-statics`](../test/golden/cases/compound-component-statics)

A component VALUE that carries other components as properties — `const Menu: FC<MenuProps> &
{ Item: FC<ItemProps> }`, the dominant pre-Radix idiom (antd, react-bootstrap, headlessui). Each
component-typed own value-property becomes a **sibling module bound through the parent object**
(the same `@scope` mechanism as namespace exports — runtime-correct because the static lives ON
the parent value), and the parent file ends with zero-cost aliases enabling the documented JSX
idiom. Own-property enumeration reuses the callable-with-properties filter (#103): vendor-declared
members (`FC.displayName`, `propTypes`) and phantom brands never count.

| TypeScript | ReScript |
|---|---|
| `const Menu: FC<{open?}> & { Item: FC<{label}> }` | `MenuItem.res`: `@module("pkg") @scope("Menu") external make: (~label: string) => React.element = "Item"`; `Menu.res` ends with `module Item = MenuItem` → `<Menu.Item label="…" />` works |
| `Menu.VERSION: string` (non-component static) | **reported** in the skipped list (`Menu.VERSION`, `compound-static-not-a-component`) — previously every static vanished silently |
| `const Select: FC<…> & { Option: typeof SelectOption }` where `SelectOption` is ALSO exported flat | no duplicate sibling — the static dedupes by type identity and `Select.res` aliases the existing flat module (`module Option = SelectOption`, bound `= "SelectOption"` which is runtime-real) |
| `const Table: FC<…> & { Summary: FC<…> & { Row: FC<…> } }` (nested, antd's `Table.Summary.Row`) | the inner static binds with a scope PATH — `TableSummaryRow.res`: `@scope(("Table", "Summary")) … = "Row"` — and each level aliases its children, so `<Table.Summary.Row />` compiles to `pkg.Table.Summary.Row` (depth-capped defensively) |

(#100)

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
