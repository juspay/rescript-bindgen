type t = InstanceTypes.bus
@new @module("demo") external make: (~name: string) => t = "Bus"
@send external on: (t, ~event: string) => unit = "on"
@send external close: (t) => unit = "close"
