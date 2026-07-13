type t = InstanceTypes.store
@new @module("demo") external make: (~initial: float) => t = "Store"
@send external get: (t) => float = "get"
@send external set: (t, ~v: float) => unit = "set"
@get external size: t => float = "size"
