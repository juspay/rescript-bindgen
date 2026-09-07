type t = InstanceTypes.demoGizmo
@send external resize: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => unit = "resize"
@send external destroy: (t) => unit = "destroy"
@get external size: t => float = "size"
