// Constructor de-collision (#33, surfaced when the heal recovered Highcharts'
// `svgPathCommand`). A string-literal union with case-only-distinct members — `'a'` and
// `'A'` both pascal-case to `A` — would emit two constructors named `A`, which ReScript
// rejects ("Two constructors are named A"). The `@as` arm keeps the real runtime value,
// so a numeric suffix on the later collision (`A` / `A2`) is a safe, zero-cost rename.
type JsxElement = { __brand: 'element' }
type PathCmd = 'a' | 'A' | 'm' | 'M' | 'z'

export declare const Widget: (props: {
  cmd?: PathCmd
}) => JsxElement
