// Namespace exports (#25, base-ui's exact shape): the VALUE is only reachable through
// `export * as Widget` — the flat re-exports below are `export type` (TYPE-ONLY,
// undefined at runtime!). Components reachable as namespace members bind THROUGH the
// namespace object:
//   WidgetRoot.res:  @module("demo") @scope("Widget") external make: … = "Root"
// plus a zero-cost alias module enabling the documented JSX idiom:
//   Widget.res:  module Root = WidgetRoot   ->   <Widget.Root />
export * as Widget from './parts'
export type { WidgetRoot, WidgetItem } from './impl'
