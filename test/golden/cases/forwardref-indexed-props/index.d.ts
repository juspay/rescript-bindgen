// #92 — a component whose props carry a string index signature (`[key: string]: any`, common in
// third-party libs such as highcharts-react's `HighchartsReactProps`) was SILENTLY DROPPED.
//
// When `Omit<…, "ref">` is applied over a type that has an index signature, TypeScript collapses
// EVERY named property into the index signature: `Omit<{ [k:string]: any; options?: … }, "ref">`
// degrades to just `{ [k:string]: any }`. So bindgen read ZERO named props (only `ref`/`key`, which
// it filters out) and bucketed the whole component as `no-props` — no binding, no warning. This hit
// blend's `BlendChart` / `ChartV2` (both `forwardRef` over `HighchartsReactProps`).
//
// The fix recovers the named props from the PRE-`Omit` type (`X` in `Omit<X, K>`, minus the omitted
// keys). `Chart` below must GENERATE with `options` / `immutable` / `onRender` — not vanish.
type JsxElement = { __brand: 'element' }
interface RefAttributes<T> { ref?: { current: T | null } }
type ForwardRefExoticComponent<P> = (props: P) => JsxElement

interface ChartRef { chart: string }

interface ChartProps {
  [key: string]: any          // ← the index signature that triggers the Omit collapse
  options?: { title: string }
  immutable?: boolean
  onRender?: (id: string) => void
}

// mirrors blend's BlendChart: a forwardRef component typed `Omit<Props, "ref"> & RefAttributes<Ref>`.
declare const Chart: ForwardRefExoticComponent<Omit<ChartProps, "ref"> & RefAttributes<ChartRef>>
export default Chart

// Control — a sibling WITHOUT an index signature already binds fine; proves the fix is scoped.
declare const PlainChart: (props: { label: string }) => JsxElement
export { PlainChart }
