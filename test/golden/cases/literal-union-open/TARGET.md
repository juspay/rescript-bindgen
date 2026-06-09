# `literal-union-open` — `LiteralUnion | string` → `@unboxed` variant with `Custom(string)`

The "LiteralUnion" idiom — a string-literal union widened by `| string`:

```ts
type ToastPosition = 'top-right' | 'top-center' | 'top-left' | 'bottom-right' | 'bottom-center' | 'bottom-left'

export declare const LiteralUnionOpen: (props: {
  position: ToastPosition | string  // open  -> @unboxed variant + Custom(string) catch-all
  anchor: ToastPosition             // pure  -> closed variant
}) => JsxElement
```

## Emitted (this is what `expected/` now contains)

```rescript
// CommonTypes.res — the OPEN form (note `OrString` + the Custom arm)
@unboxed type toastPositionOrString =
  | @as("top-right") TopRight | @as("top-center") TopCenter | @as("top-left") TopLeft
  | @as("bottom-right") BottomRight | @as("bottom-center") BottomCenter | @as("bottom-left") BottomLeft
  | Custom(string)            // the `| string` escape hatch

// LiteralUnionOpenTypes.res — the PURE form stays a closed enum
type toastPosition = | @as("top-right") TopRight | … | @as("bottom-left") BottomLeft

// LiteralUnionOpen.res
~position: CommonTypes.toastPositionOrString,   // typo-safe known values + any other string
~anchor: LiteralUnionOpenTypes.toastPosition,   // closed (no Custom)
```

Use: `position=TopRight` for a known value, `position=Custom("my-spot")` for anything else.

## Why & how

TS **collapses** `'a' | 'b' | string` to bare `string` (the literals vanish from the resolved type),
so the literals are recovered from the **syntactic** union node at the prop level
(`src/extract.mjs` `literalUnionOpen` / `literalUnionOpenNode`, wired in `buildComponentIR`). The
result is `@unboxed` → **zero-cost** (verified: `TopRight` → `"top-right"`, `Custom("x")` → `"x"`),
typo-safe on the knowns, still open. A **pure** literal union (no `| string`) keeps mapping to a
closed enum. The `(string & {})` brand form is unaffected (it doesn't collapse → closed enum).

Naming: the open variant is `<base>OrString` (matching `boolOrString` / `stringOrNumber`), leaving the
bare name for the closed enum. Bucketed ✅ usable (no longer widened to `string`).

> Note: detection is at the component-prop level (where the AST node is available). A `LiteralUnion
> | string` nested deeper (inside a record field or callback param) still collapses to `string` for
> now — a future extension could thread the syntactic node down.
