type t = InstanceTypes.demoRoot
@send external makeGizmo: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => InstanceTypes.demoGizmo = "makeGizmo"
@get external version: t => string = "version"
