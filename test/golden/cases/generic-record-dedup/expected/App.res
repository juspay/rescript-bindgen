type t = InstanceTypes.app
@new @module("demo") external make: unit => t = "App"
@send external start: (t) => GenericRecordDedupTypes.routerV89air = "start"
