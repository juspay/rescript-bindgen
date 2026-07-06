// #98 follow-up — a `this`-typed callback (`(this: Point, tooltip: Tooltip) => string`,
// Highcharts' formatter family): JS invokes the consumer's function with `this` bound to the
// DATA CARRIER. The `this` parameter was silently dropped, so the emitted callback type-checked
// but could not reach the value it's about (the tooltip formatter's Point — blend's last chart
// blocker). ReScript expresses the shape exactly: `@this ((point, tooltip) => string)` — the
// first param binds `this`.
//
//   formatter     -> ~formatter: @this ((point, tooltip) => string)=?
//   onLabel       -> a this-fn with NO other params: @this ((point) => string)
//   onSimple      -> control: no `this` param — plain callback, unchanged
//   record field  -> the same emission inside a shared record (opts.formatter)
//
// #110 — a @this param CYCLING BACK to an in-progress ancestor must keep its real type. The
// `deep` chain (l1→…→l6) passes THROUGH `Widget` before reaching `widgetOpts.formatter` past
// MAX_DEPTH; its `w: Widget` param references the ancestor still being built. A registered
// in-progress entry is a zero-expansion link (the name registers before the fields build — the
// same guarantee below-bound back-refs use), so this lands as `type rec widget = …` with
// `formatter?: @this ((point, widget) => string)` — NOT `(point, string)`.
type JsxElement = { __brand: 'element' }

interface Point { x: number; y: number; name?: string }
interface Tooltip { shared?: boolean }

interface ChartOpts {
  formatter?: (this: Point, tooltip: Tooltip) => string
}

// the #110 cycle: Widget is an ANCESTOR on the traversal path when formatter's params classify.
// WidgetOpts is reached AT the depth boundary (so it registers and builds), and its formatter
// field classifies PAST it — the blend TooltipOptions shape exactly.
interface WidgetOpts {
  formatter?: (this: Point, w: Widget) => string
}
interface W5 { opts?: WidgetOpts; s5?: string }
interface W4 { w5?: W5; s4?: string }
interface W3 { w4?: W4; s3?: string }
interface W2 { w3?: W3; s2?: string }
interface W1 { w2?: W2; s1?: string }
interface Widget { chain?: W1; id?: string }

export declare const Chart: (props: {
  formatter?: (this: Point, tooltip: Tooltip) => string
  onLabel?: (this: Point) => string
  onSimple?: (value: number) => void
  opts?: ChartOpts
  widget?: Widget
}) => JsxElement
