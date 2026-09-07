type t = InstanceTypes.htmlCanvasElement
// ⚪ loose: `getContext` has a param/return widened to `string`.
@send external getContext: (t, ~contextId: string) => Nullable.t<InstanceTypes.demoGizmo> = "getContext"
