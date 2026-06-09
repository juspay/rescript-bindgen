type t = InstanceTypes.counter
@new @module("demo") external make: (~start: float, ~step: int=?, unit) => t = "Counter"
@send external increment: (t, ~by: float) => t = "increment"
@send external reset: (t) => unit = "reset"
@get external value: t => float = "value"
