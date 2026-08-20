type t = InstanceTypes.app
@new @module("demo") external make: unit => t = "App"
@send external start: (t) => GenericRecordDedupTypes.routerUs8op = "start"
