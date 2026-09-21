// #194: abstract handle — obtain a `t` from an API call that returns it (or your own
// Webapi/DOM binding for a host global); this module does not construct one.
type t = InstanceTypes.htmlCanvasElement
// ⚪ loose: `getContext` has a param/return widened to `string`.
@send external getContext: (t, ~contextId: string) => Nullable.t<InstanceTypes.demoGizmo> = "getContext"
