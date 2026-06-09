type t = InstanceTypes.tracker
@new @module("demo") external make: (~options: ClassExportsTypes.options) => t = "Tracker"
@send external watch: (t, ~counter: InstanceTypes.counter) => unit = "watch"
@send external snapshot: (t) => ClassExportsTypes.options = "snapshot"
