type t = InstanceTypes.demoGizmo
@new external make: unit => t = "DemoGizmo"
@send external resize: (t, ~descriptor: GlobalDeclarationsTypes.demoGizmoDescriptor) => unit = "resize"
@send external destroy: (t) => unit = "destroy"
@get external size: t => float = "size"
