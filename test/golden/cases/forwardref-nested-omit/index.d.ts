// #98.1 — the #92 index-signature `Omit` recovery was SINGLE-LEVEL: it unwrapped only the outer
// `Omit<…,"ref">`, then read properties off the base — but when the base is ITSELF an
// intersection containing another `Omit` over the index-signature-poisoned type, those inner
// named props are still collapsed and were silently dropped.
//
// Real shape (blend-design-system's `ChartV2` over highcharts-react-official): only the 3 inline
// literal members (`highcharts`/`skeleton`/`noData`) survived; all 8 `HighchartsReactProps`
// members vanished with no warning. The recovery must recurse: unwrap every `Omit` layer
// (accumulating omit keys — `className`/`style` from the inner one, `ref` from the outer), split
// still-poisoned intersections, and union the leaf-level named props.
//
//   Chart      — the nested-Omit shape: MUST emit allowChartUpdate/constructorType/containerProps/
//                immutable/options/updateArgs/callback AND skeleton/noData, MINUS className/style/ref.
//   FlatChart  — single-level Omit control (the original #92 shape) — must keep working unchanged.
type JsxElement = { __brand: 'element' }
interface RefAttributes<T> { ref?: { current: T | null } }
type ForwardRefExoticComponent<P> = (props: P) => JsxElement

interface ChartRef { chart: string }

interface ChartReactProps {
  [key: string]: any          // ← the index signature that poisons every Omit layer
  allowChartUpdate?: boolean
  containerProps?: { [key: string]: any }
  immutable?: boolean
  options?: { title: string }
  className?: string          // omitted by the INNER Omit — must NOT appear
  style?: { color: string }   // omitted by the INNER Omit — must NOT appear
  callback?: (id: string) => void
}

interface SkeletonProps { variant?: string }

// inner Omit over the poisoned type, intersected with extra literal members…
type ChartProps = Omit<ChartReactProps, 'className' | 'style'> & {
  skeleton?: SkeletonProps
  noData?: boolean
}

// …then a SECOND Omit layer around the whole thing (the standard forwardRef wrapper).
declare const Chart: ForwardRefExoticComponent<Omit<ChartProps, 'ref'> & RefAttributes<ChartRef>>
export { Chart }

// Control — the single-level #92 shape must be untouched by the recursive recovery.
declare const FlatChart: ForwardRefExoticComponent<Omit<ChartReactProps, 'ref'> & RefAttributes<ChartRef>>
export { FlatChart }
