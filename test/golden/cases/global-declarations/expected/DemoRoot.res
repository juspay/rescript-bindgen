// #194: abstract handle — obtain a `t` from an API call that returns it (or your own
// Webapi/DOM binding for a host global); this module does not construct one.
type t = InstanceTypes.demoRoot
@send external makeGizmo: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => InstanceTypes.demoGizmo = "makeGizmo"
@send external requestGizmo: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => promise<Nullable.t<InstanceTypes.demoGizmo>> = "requestGizmo"
@get external version: t => string = "version"
