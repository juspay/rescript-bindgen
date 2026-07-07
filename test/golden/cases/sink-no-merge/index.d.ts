// #115 pkg — a synthetic @unboxed union must NEVER home into a SINK module (CommonTypes) when it
// also has a NON-sink dep, or it draws a sink OUT-edge that closes a spurious cross-module cycle and
// collapses CommonTypes (+ everything Tarjan then fuses) into one giant `…SharedTypes` module —
// exactly the blend regression where CommonTypes/ButtonTypes/ChartsTypes vanished.
//
// `Chart.data` is `(string|number) | (string|number)[] | ChartPoint`: the array arm creates the
// CommonTypes `stringOrNumber` dep (deps[0]), the record arm the `chartPoint` dep. The reassign rule
// used to take deps[0] → home CommonTypes → poison edge `CommonTypes → ChartTypes`. Now it prefers
// the first NON-sink dep → the union lives in ChartTypes, and CommonTypes stays a dependency-free
// sink (its own module, never merged). `stringOrNumber` (used by both Chart and Panel) stays in
// CommonTypes with zero out-edges.
export { Chart } from './components/Chart/Chart'
export { Panel } from './components/Panel/Panel'
