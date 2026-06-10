type t = InstanceTypes.impl
@new @module("demo") external make: unit => t = "Impl"
@send external run: (t) => string = "run"
@send external chain: (t, ~value: string) => t = "chain"
@send external reset: (t) => t = "reset"
