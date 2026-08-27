# #210 — the `(string & {})` open-literal idiom must reduce to `string`, not a `{ ...JsxDOM.domProps }` bag

Status: DRAFT (design)
Issue: https://github.com/juspay/rescript-bindgen/issues/210

## §0 Plain English — what breaks and what we want

TypeScript libraries write "open literal" props with a well-known trick:

```ts
type Color = "red" | "blue" | (string & {})
//                            ^^^^^^^^^^^^ "any string, but KEEP red/blue as autocomplete hints"
```

`(string & {})` is semantically just **`string`**. The `& {}` is a compile-time-only nudge that
stops TypeScript from eagerly widening the literal union to bare `string` (so the editor still
suggests `red`/`blue`). It carries **no data** — at runtime the value is a plain string.

**What we emit today (wrong).** When the value is NOT a `csstype` union (so the CSS-globals collapse
in `isCssType` doesn't fire), the general classifier processes the `(string & {})` arm on its own.
The checker hands back the *apparent object* of `string` — an object carrying `String`'s prototype
(`charAt`, `charCodeAt`, `[x:number]: string`, …). Those members are declared in `lib.es*`, and the
record builder's DOM-attribute heuristic (`hasHtml`) treats *any* `lib.*`/`@types/*` member as an
inherited HTML attribute — so it mistakes the stringy object for a DOM element and mints a **bogus
record**:

```rescript
type contextComponentTokensBUTTONV2SmGapConfig = { ...JsxDOM.domProps }   // a bag of HTML attributes
@unboxed type stringOrNumberOrContextComponentTokensBUTTONV2SmGapConfig =
  Str(string) | Num(float) | ContextComponentTokensBUTTONV2SmGapConfig(contextComponentTokensBUTTONV2SmGapConfig)
  gap?: stringOrNumberOrContextComponentTokensBUTTONV2SmGapConfig,
```

That is a **confident-but-wrong** type — precisely what the project's *flag-don't-fake* contract
forbids. A consumer can put arbitrary `JsxDOM.domProps` (`onClick`, `className`, …) where the library
wants a spacing string.

**What we want.** `(string & {})` → **`string`**. Because `gap`'s TS is `string | number | (string
& {})`, the reduced arm merges into the existing `string` arm and the whole union collapses:

```rescript
  gap?: CommonTypes.stringOrNumber,        //  @unboxed Str(string) | Num(float) — the junk record is gone
```

That is a genuine **fidelity gain**: a usable typed field replaces the nonsense bag. The same holds
for every other `(string & {})` / `(number & {})` site (blend's `selectorV2As`, and any csstype
value already handled by `isCssType` is unaffected).

## §1 The defect precisely

- TS `(string & {})` reaches `classify` in one of two forms:
  1. the **raw intersection** `string & {}` — a `String` part + object parts with **zero own props**;
  2. its **apparent object** after a homomorphic mapped-type projection (`DeepPartial<>` etc.) —
     `{ readonly [x:number]: string; charAt?; charCodeAt?; … }` (String) or `{ toFixed?; … }` (Number).
- `classify` has no rule that recognises either form as "just the primitive". So:
  - form (1) falls through to the intersection/object path → `recordNode` → `buildRecordFields`;
  - form (2) is already an object → same path.
- In `buildRecordFields` (`src/extract.mjs`), `hasHtml = props.some(isInherited)` is **true** (String's
  prototype methods are declared in `lib.es*`, which `isInherited` matches by file path), and there are
  **zero** own first-party fields, so `spread = 'JsxDOM.domProps'` and `fields = []` → a spread-only
  `{ ...JsxDOM.domProps }` record.
- `isForeignArm` (`:1128`) *does* already recognise this open arm (the `charCodeAt`/`toFixed`
  fingerprint → returns `false` = not foreign), **but** it is consulted only by `unionStringLiterals`
  → `isCssType`. A non-csstype union (`gap` has no `CSS_GLOBALS`) never reaches that path, so the
  reduction never happens.

**Scope note (deliberately narrow).** The blend baseline shows 7 spread-only `{ ...JsxDOM.domProps }`
junk records. Only **2** are this idiom (`gap`, `selectorV2As`). The other 5 are the *same*
`hasHtml`-misfire reached through **different non-DOM inherited members** — `MutableRefObject.current`
(a `ReturnType<typeof setTimeout>` ref), DOM `CustomEvent`/`PointerEvent`, `Intl.DateTimeFormatOptions`,
a nested React props object. Those are a related but distinct root (the coarse `isInherited` DOM
signal), NOT the `(string & {})` idiom this issue names. Fixing them means tightening the DOM-attribute
test globally — a much larger blast radius across hundreds of legitimate `{...JsxDOM.domProps}` records.
**Out of scope for #210**; filed/tracked separately. This PR fixes exactly the idiom in the issue title.

## §2 Why the idiom is safe to reduce (no data loss)

- `(string & {})` / `(number & {})` carry **no own properties** (the object part is `{}`), so reducing
  to the primitive drops nothing.
- A **branded** primitive (`string & { readonly __brand: "x" }`) DOES carry a marker prop and must stay
  its nominal `@unboxed` variant — that is handled *earlier* by `brandedPrimitiveNode`
  (`brandedPrimitivePayload` requires `markerFields > 0`). The RAW-intersection detector requires the
  object parts to contribute **zero** own props, so a brand can never be mistaken for the open idiom.
- **Apparent-object form — a single method-name match is NOT enough (review fix).** `isForeignArm`
  trusts the `charCodeAt`/`toFixed` fingerprint only inside a csstype/union-arm context; at the top of
  `classify` it runs on *every* type, so a bare `names.has('charCodeAt')` would fire on any real record
  that merely OWNS such a method — a money/decimal type (`{ toFixed(); plus(); currency; … }`,
  decimal.js/bignumber.js) or `{ charCodeAt(); label }` — and silently collapse it to a bare primitive
  (a flag-don't-fake violation, and directly relevant to a payments codebase). So the apparent-object
  branch CORROBORATES: the distinctive method must be present **and EVERY own (non-symbol) property must
  be a genuine `String`/`Number` prototype member** (`STRING_PROTOTYPE_MEMBERS` / `NUMBER_PROTOTYPE_MEMBERS`).
  A real record carries a member outside that set (`currency`, `plus`, `label`) → not the idiom → keeps
  its full record/union. Declaration-independent (survives the `DeepPartial<>` mapped projection, whose
  props are synthesized) and errs SAFE — an unrecognised member (a newer lib.es addition) yields the
  faithful record, never a fake. Symbol-keyed members (`__@iterator`) are ignored (always built-in).

## §3 Approach

Add one dependency-free helper `openPrimitiveIdiom(type)` returning `'string' | 'float' | null`, and
consult it at the **top of `classify`**, right after `brandedPrimitiveNode` and before the depth/object
paths — the same placement, for the same reason, that branded primitives and `void`/`undefined` use: a
no-data runtime leaf must never be degraded by the depth bound or misrouted into `recordNode`.

```
classify(type):
  branded = brandedPrimitiveNode(...)      ; if branded return branded          // existing
  if void|undefined return unit                                                  // existing
  idiom = openPrimitiveIdiom(type)                                               // NEW
  if idiom === 'string' return { kind: 'string' }                                // NEW
  if idiom === 'float'  return { kind: 'number', _float: true }                  // NEW
  … depth guards / object / record …                                             // existing
```

Because the reduction happens **before** any union/record machinery and is **depth-invariant**, every
position is covered at once — a standalone `(string & {})`, a union arm (`gap`), an opaque-module union
(the exact wording of the issue title), a record field, an array element. The junk record is never
minted, so there is nothing for the heal (#208) to relocate either.

`openPrimitiveIdiom(type)`:
- **apparent-object form:** `type.flags & Object`; if its property names include `charCodeAt` → `'string'`,
  `toFixed` → `'float'`, else `null`.
- **raw-intersection form:** `type.flags & Intersection`; walk `type.types` — exactly one primitive part
  (`String` → string, `Number` → float), every other part an Object with **no** call signatures and
  **zero** own props; else `null`. Return the primitive iff `ownProps === 0`.

Number reduces to `{ kind: 'number', _float: true }` (force float): int-ness is unknowable for an open
numeric literal, and float matches the branded/`@unboxed`-member convention (`:1240`, `:6023`).

## §4 Implementation (files)

1. **`src/extract.mjs`** — add `openPrimitiveIdiom` near `brandedPrimitivePayload` (they are siblings —
   both peel a primitive out of an intersection); call it in `classify` right after the branded/`unit`
   guards. Terse, heavily-commented per house style; cross-reference `isForeignArm` (shares the
   fingerprint) and `brandedPrimitivePayload` (the mutually-exclusive branded case).

2. **`docs/TYPE_MAPPING.md`** — a row: TS `(string & {})` / `(number & {})` (open-literal idiom) →
   ReScript `string` / `float`; note it is distinct from a branded primitive and from a csstype union.

3. **`test/golden/cases/open-string-idiom/`** — new self-contained fixture (see §5).

4. **`benchmark/baselines/`** — regenerate; expect the 2 `(string & {})` junk records gone, `gap`-style
   fields typed `stringOrNumber`. `bench:update`, commit the diff.

## §4b Two-part fix (discovered during implementation)

The classify-top reduction alone is **necessary but not sufficient**: `classify` is bypassed by the
dedicated **union** machinery (`unionNodeCore`), which inspects raw arms. So a second, small change is
needed there. Both are required; verified against real blend:

1. **`classify` top** — reduce a STANDALONE `(string & {})` / apparent-object to `string`/`float`
   (handles a field typed exactly the idiom, and feeds the union builder the right per-arm type).
2. **`unionNodeCore`** — after the same-primitive collapse, **drop an open-idiom arm that is redundant
   with a bare `string`/`number` arm already in the union**. Without it, `gap: string | number |
   (string & {})` presents the `@unboxed` builder with TWO string-bucket members (bare `string` + the
   reduced idiom), fails its one-broad-type-per-`typeof` discriminability check, and bails the WHOLE
   union to loose `string` — silently dropping the `number` arm. With the dedup it resolves to the clean
   `string | number` → `stringOrNumber`. A pure-literal open union (`"a" | "b" | (string & {})`, no bare
   `string`) has no bare primitive to be redundant with, so it is untouched — the existing literal-variant
   path (`:5646`) still handles it (drops the escape into a clean `@as` variant).

## §5 Tests — VERIFIED behavior (pin exactly this)

New golden `open-string-idiom` (one component's props) + the existing `csstype-deeppartial-widening`
golden updates. Verified outputs:
- `gap?: string | number | (string & {})` → `CommonTypes.stringOrNumber` — **the headline win**; the
  `@unboxed Str|Num|Config` junk record is GONE, `number` preserved.
- `space?: number | (number & {})` → `float`.
- `onlyOpen?: (string & {})` (standalone) → `string`.
- `brand: string & { readonly __brand: "id" }` → stays its branded `@unboxed` variant (the idiom
  reduction does NOT swallow a real brand — `openPrimitiveIdiom` requires ZERO own props; branded runs
  first anyway).
- `color?: "red" | "blue" | (string & {})` → **closed `@as` variant `Red | Blue`** (the escape is
  dropped). This is PRE-EXISTING behavior (`:5646`), unchanged by this fix — NOT a regression this PR
  introduces. A pure-literal open union has always mapped this way.
- a `DeepPartial<{ c: "red" | (string & {}) }>` field (apparent-object form in a literal union) → honest
  loose `string` (no junk). Different code path from the raw form; both faithful, neither junk.

**`csstype-deeppartial-widening` golden** (the canonical #210 repro — an opaque-module union
`Color | CustomArm`): the `(string & {})` arm's `{ ...JsxDOM.domProps }` bag + its `from…Config`/`as…Config`
views become `fromString: string`/`asString`, while the genuine `CustomArm` arm is preserved. csstype
`gap`/`width` leaves stay clean `string` (contract mapping).

**Opaque-union construction note stays complete.** When an arm reduces from a NAMED record member to an
unnamed bare-`string` member, the old note gate (which required *every* member to carry a `.name`) would
suppress the whole `ⓘ … build with …` hint. The note builder now mirrors emit's `fromName` exactly —
including the unnamed primitive member → `fromString` — so the hint stays accurate (and is *added* to a
few opaque modules that previously lacked one, e.g. `record-props`/`views-module-readers`). Prominent
props like styled-components' `as` (`WebTarget.t`) keep their construction hint.

`checkNoStrayIdentity` + the golden diff enforce it. `npm test`, `test:compile`, `bench` all green.

## §6 Risks

- **Blast radius:** the reduction fires only on the exact open-idiom shape (primitive + zero-own-prop
  objects, or the String/Number fingerprint). A branded primitive (marker prop) and any real record
  (own props) are excluded by construction. csstype unions already collapse via `isCssType` and are
  untouched. Risk is low and is bounded by the golden + bench diff (a stray reduction would show as
  churn there).
- **`float` vs `int`:** forcing float for `(number & {})` could mis-tag a field a name-heuristic would
  call `int`. Acceptable — the open idiom is inherently un-narrowable, and float is the lossless choice
  (every int is representable), matching existing conventions.
- **Not closing all 7 junk records:** intentional (see §1 scope note). The other 5 are a separate DOM-
  signal issue; conflating them here would balloon blast radius across legitimate DOM-props records.
