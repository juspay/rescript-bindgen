type t = InstanceTypes.headers
@new @module("demo") external make: unit => t = "Headers"
// ⚪ loose: `set` has a param/return widened to `string`.
@send external set: (t, ~name: string, ~value: string=?, unit) => unit = "set"
@send external only: (t, ~name: [#"Content-Type"]) => unit = "only"
// ⚪ loose: `pick` has a param/return widened to `string`.
@send external pick: (t, ~name: string) => string = "pick"
// ⚪ loose: `digit` has a param/return widened to `string`.
@send external digit: (t, ~name: string) => string = "digit"
// ⚪ loose: `escaped` has a param/return widened to `string`.
@send external escaped: (t, ~name: string) => string = "escaped"
