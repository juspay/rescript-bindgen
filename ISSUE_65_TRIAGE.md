# Issue #65 triage — `minor` widenings (blend 0.0.37-beta.6)

69 findings / 36 components. Build is **green** — none are compile errors. Tables below: TS type vs
generated ReScript vs verdict. Legend: 🟢 already fixed · 🔧 fix now · 🧩 enhancement (needs buy-in) ·
⚪ accept as-is (inherent / convention / documented).

---

## 🟢 Already fixed by recent work (re-validate to confirm — no action)

| Component | Prop | TS type | Generated (now) | Note |
|---|---|---|---|---|
| `ResponsiveText` | `fontSize` / `color` | `CSSObject['fontSize']` (required) | `~fontSize: string` (required) | fixed #64 |
| `TabsV2Trigger` / `TabsTrigger` | `children` | `string \| number` (required) | `~children: CommonTypes.stringOrNumber` | fixed #64 |
| `Styled*` (10) | `as_` | `as?: AsTarget` (optional) | `~as_: string=?` (optional) | already `=?` in current build |

---

## 🔧 Fixable defects — recommend doing now

| # | Component | Prop | TS type | Generated (now) | Should be | Fix | Risk |
|---|---|---|---|---|---|---|---|
| B1 | `UnitInput` | `value` | `number \| undefined` (required key) | `value: float` (required) | `~value: float=?` (optional) | `value` is merged: own `number\|undefined` (blend) + inherited `value?: string\|…` (`@types/react`). Our single-property-signature gate skips it. → pick the **first-party** declaration as authoritative. | med-low |
| B2 | `Drawer`, `DrawerV2`, `DrawerV2NestedRoot` | `activeSnapPoint`, `setActiveSnapPoint`, `onSnapPointChange` | `number \| string \| null` | `CommonTypes.stringOrNumber` (null dropped) | `Nullable.t<CommonTypes.stringOrNumber>` | our `\|null`→`Nullable.t` recovery only wraps a **single** non-null type; extend to multi-type unions. Matters most for the **callback** cases. | low |
| B3 | `DataTable` | `columnManagerAlwaysSelected` | `(keyof T)[]` | `string` (array lost) | `array<string>` | keep the `array<>` when only the **element** (`keyof T`) is the unmappable part. | low |
| B4 | `Button` | `onClick` | `(event?: React.MouseEvent) => void` (**one** optional-arg sig) | opaque `OnClick.t` + comment "2 call signatures / overloaded" | `(option<ReactEvent.Mouse.t>) => unit` | don't route a **single**-call-signature fn through the overload-module path; comment is also wrong. | medium |
| B5 | `Badge` (+ general) | `offset` | `[number, number]` | `string` (⚪ — no tuple support at all) | `(float, float)` | add a tuple branch to `classify` (`checker.isTupleType` → `{kind:'tuple'}`) + emit `(e1, e2)`. Keep `string` for variadic/optional-element/1-element tuples (ReScript tuples are fixed-arity, no 1-tuples). float (not int): tuple elements have no prop name. | low |

---

## 🧩 Enhancement — needs your sign-off (the only "loses guarantees" item)

| # | Components | TS type | Generated (now) | Proper fix |
|---|---|---|---|---|
| C1 | `Card`, `SelectItemV2`, `Badge` | `Base & (A \| B \| C)` discriminated union (e.g. `alignment` required in `AlignedCardProps`, `children` required in `CustomCardProps`) | one record, **every arm prop optional** (`~variant=?`, `~alignment=?`, `~children=?`) | a **ReScript variant per branch** so per-branch required-ness is preserved. Changes the generated API shape → separate task + golden/benchmark rework. Flatten-optional is a reasonable default; only if you want it. |

---

## ⚪ Accept as-is — inherent gap / convention / documented (close as by-design)

All carry `⚪ loose` / `ⓘ` comments unless noted. Listed for completeness.

| Component(s) | Prop | TS type | Generated | Why accept |
|---|---|---|---|---|
| `Button` | `justifyContent` | `CSSObject['justifyContent']` | `string` | styled-components CSS union — not modellable |
| `TextArea` | `wrap` | `CSSObject['whiteSpace']` | `string` | same |
| `AvatarV2` | `width` / `height` | `CSSObject['width']` | `string` | same |
| `SelectItemV2` | `itemTokens` | `CSSObject[...]` fields | `string` | same |
| `Styled*` (8) | `theme/forwardedAs/style`/return | `IStyledComponentBase<Substitute<…>>` | `string` | styled-components type — not modellable |
| `StatCardV2NoData` | `filteredProps` | `React.ComponentProps<'div'>` | `string` | documented loose |
| `DataTable` | `columns` / `idField` | `ColumnDefinition<T>[]` / `keyof T` | `string` | generic — documented loose |
| `DateRangePicker` | `customPresets` | `PresetsConfig` (union array) | `string` | union-of-generics — documented loose |
| `PivotTableModal` | `columns` / `data` | `ColumnDefinition<T>[]` / `T[]` | `string` / `array<'a>` | generic |
| `TextInputV2` | `dropdown` | `TextInputV2Dropdown \| TextInputV2Dropdown[]` | `string` (REVIEW) | multi-shape — documented |
| `DataTable` | `onFieldChange`/`onHeaderChange`/`on*` | `(keyof T) => void` etc. | `'b => unit` (ⓘ) | `keyof T` param → type var; arity/return correct |
| `AvatarGroup` | `avatars[].fallback` | `string \| React.ReactNode` | `React.element` | convention (covers strings) |
| `SingleSelect` | `items[].tooltip` | `string \| React.ReactNode` | `React.element` | convention |
| `Badge` | `count` | `number` | `int` | int/float heuristic |
| `Badge` | `offset` | `[number, number]` | `string` (⚪) | tuple — documented loose |
| `TabsContent` / `TabsV2Content` | `forceMount` | `forceMount?: true` (literal) | `bool=?` | harmless literal widening |
| `CodeEditorV2` | `onBlur` / `onFocus` | `() => void` (merged w/ HTMLAttributes overload) | opaque `OnBlur.t` (ⓘ asThunk/asEvent) | overloaded via Omit — documented |
| `ResponsiveText` | `as` | `React.ElementType` | `ReactTypes.ElementType.t` | opaque — documented |
| `SingleSelectV2Menu` | `collisionBoundary` | `Element \| Element[] \| null` | opaque `CollisonBoundaryRef.t` | documented opaque |
| `MenuV2` | `triggerProps` | `Omit<ButtonHTMLAttributes,'className'\|'style'>` | `reactPrimaryActionButtonPropsConfig` | approximation |
| `MenuV2Content` | `onInteractOutside` | `(e: unknown) => void` | `JSON.t => unit` | correct (unknown→JSON.t) |
| `Upload` | `value` / `onChange` | `File \| File[] \| null` | opaque `UploadFormValue.t` (from*) | documented opaque module |
| `ThemeProvider` | `foundationTokens` | `ThemeType` | `'a` | no ThemeType binding — widening |
| `DrawerPortal` | `container` | `HTMLElement \| DocumentFragment \| null` | `Dom.element` (ⓘ) | portal target — documented |
| `Tag` | `color` / `size` | `TagColor` / `TagSize` enums | `color2` / `size2` (exact members) | only alias-name `2` suffix (cosmetic) |
| `CoreChart`, `DrawerV2.container`, `TabsV2Content.value`, `DataTable.data`, `Tag.text`, … | — | — | — | already faithful (listed as "no defect") |

---

## Recommendation
- **Do now:** B1, B2 (clear + faithful + low-risk). Optionally B3, B4.
- **Discuss:** C1 (discriminated-union variants) — real feature, your call.
- **Close by-design:** all ⚪ rows (already flagged, inherent).

Which rows do you want me to take? (Pick from B1–B4, and yes/no on C1.)
