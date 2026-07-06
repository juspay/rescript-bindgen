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
type JsxElement = { __brand: 'element' }

interface Point { x: number; y: number; name?: string }
interface Tooltip { shared?: boolean }

interface ChartOpts {
  formatter?: (this: Point, tooltip: Tooltip) => string
}

export declare const Chart: (props: {
  formatter?: (this: Point, tooltip: Tooltip) => string
  onLabel?: (this: Point) => string
  onSimple?: (value: number) => void
  opts?: ChartOpts
}) => JsxElement
