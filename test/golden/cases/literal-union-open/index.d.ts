// LiteralUnion widened by `| string` (the plain form — TS collapses `"a" | "b" | string`
// to bare `string`, losing the members). TARGET mapping: an `@unboxed` variant with the
// literals as `@as` arms PLUS a `Custom(string)` catch-all — zero-cost, typo-safe on the
// known values, still accepts any other string. Contrast with a *pure* literal union,
// which stays a closed variant.
//
// NOTE: distinct from the `(string & {})` brand form (see the `string-enums` case), which
// TS does NOT collapse. This case is the plain `| string` widening.
type JsxElement = { __brand: 'element' }
type ToastPosition = 'top-right' | 'top-center' | 'top-left' | 'bottom-right' | 'bottom-center' | 'bottom-left'

export declare const LiteralUnionOpen: (props: {
  position: ToastPosition | string  // open  -> @unboxed variant + Custom(string) catch-all
  anchor: ToastPosition             // pure  -> closed variant (no catch-all)
}) => JsxElement
