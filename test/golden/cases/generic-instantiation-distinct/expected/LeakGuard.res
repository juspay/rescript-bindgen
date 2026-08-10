type t = InstanceTypes.leakGuard
@new @module("demo") external make: unit => t = "LeakGuard"
@send external afterLeak: (t) => [#"leakExact"] = "afterLeak"
