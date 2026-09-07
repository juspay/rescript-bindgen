type t = InstanceTypes.htmlCanvasElement
// ⚪ loose: `getContext` has a param/return widened to `string`.
@send external getContext: (t, ~contextId: string) => InstanceTypes.demoGizmo = "getContext"
