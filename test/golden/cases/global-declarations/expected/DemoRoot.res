type t = InstanceTypes.demoRoot
@send external makeGizmo: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => InstanceTypes.demoGizmo = "makeGizmo"
@send external requestGizmo: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => promise<Nullable.t<InstanceTypes.demoGizmo>> = "requestGizmo"
@get external version: t => string = "version"
