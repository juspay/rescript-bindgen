// The FALLBACK lock: SVGAttributes (and AllHTMLAttributes) are out of scope for the
// shared HtmlAttrs spread — a component extending them keeps the legacy labeled-args
// output, with its declared props inlined as before.
type JsxElement = { __brand: 'element' }
interface SVGAttributes<T> { fill?: string; stroke?: string }

export declare const Icon: (props: {
  name?: string
} & SVGAttributes<SVGElement>) => JsxElement
