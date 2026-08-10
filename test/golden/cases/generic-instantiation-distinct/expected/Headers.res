type t = InstanceTypes.headers
@new @module("demo") external make: unit => t = "Headers"
// ⚪ loose: `set` has a param/return widened to `string`.
@send external set: (t, ~name: string, ~value: string=?, unit) => unit = "set"
@send external only: (t, ~name: [#"Content-Type"]) => unit = "only"
