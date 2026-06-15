// #53 — a non-discriminable union with a LARGE run of string literals (here a tag-name
// set, the shape React's `ElementType`/`keyof JSX.IntrinsicElements` expands to) collapses
// its literal arms into ONE `fromTag: [#"a" | …] => t` polyvar constructor instead of one
// named constant per literal — same exactness, ~1 line instead of ~2N. The two object arms
// (which can't be @unboxed-discriminated, forcing the opaque module) keep their own
// `from*`. A SMALL literal set (< threshold) still emits named constants (see `vendor-views`
// Boundary's `clippingAncestors`).
type JsxElement = { __brand: 'element' }
interface CompClass { render: () => JsxElement }
interface CompFn { tag: string; mount: () => void }
// 6 tag literals (>= threshold) + 2 OBJECT arms -> not @unboxed-able -> opaque module
type WrapperLike = 'div' | 'span' | 'section' | 'article' | 'aside' | 'nav' | CompClass | CompFn

export declare const Widget: (props: {
  wrapper?: WrapperLike
}) => JsxElement
