# `overload-intersection` — overloaded function → opaque module with `%identity` views

`CloseToastFunc` is an **intersection of two call signatures** — a TS overload:

```ts
type CloseToastFunc = ((reason?: boolean | string) => void) & ((e: MouseEvent) => void)
```

ReScript has no overloaded-function type. Since an overloaded JS function is **one runtime value**
viewable as several typed functions, the faithful, zero-cost model is an opaque-type module with one
`%identity` **accessor view** per signature (reverse `as*` direction, opaque→concrete). **No overload
is dropped.** This is the rung-3 fidelity fallback (see `docs/TYPE_MAPPING.md` → "The contract").

## Emitted (this is what `expected/` now contains)

```rescript
// CommonTypes.res
@unboxed type boolOrString = Bool(bool) | Str(string)
module CloseToastFunc = {
  type t
  external asReason: t => (option<boolOrString> => unit) = "%identity"  // reason? -> option<>
  external asMouse:  t => (ReactEvent.Mouse.t => unit)   = "%identity"  // the event overload, kept
}

// CloseButton.res
~closeToast: CommonTypes.CloseToastFunc.t,  // ⓘ overloaded — view with CloseToastFunc.asReason / asMouse
```

Usage: `CloseToastFunc.asReason(closeToast)(None)` to close; `onClick={CloseToastFunc.asMouse(closeToast)}`.

## Verified

- **Compiles** (`npm run test:compile`).
- **Zero-cost** — the `%identity` views vanish: `asReason(closeToast)(None)` → `closeToast(undefined)`,
  `asReason(closeToast)(Some(Str("x")))` → `closeToast("x")`, `asMouse(closeToast)` → the bare function.
- Bucketed ✅ usable (nothing dropped). Falls back to 🔍 review only if a signature has an untypeable param.

## Mechanics (where this lives in the generator)
- `src/extract.mjs` `classify` (≥2 call sigs → `overloadModule`); `overloadModule` builds the opaque
  entry + accessor names; `functionNode` captures param optionality (`?` → `option<…>`).
- `src/emit.mjs` `renderOpaque` (the `variant:'overload'` branch emits the `as*` accessors).
- `test/golden.mjs` contract linter allows `%identity` on `from*`/`as*` lines.
