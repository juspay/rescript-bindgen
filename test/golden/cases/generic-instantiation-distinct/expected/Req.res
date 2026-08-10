type t = InstanceTypes.req
@new @module("demo") external make: unit => t = "Req"
// 🛑 BROKEN: `jsonBoxed` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external jsonBoxed: (t) => string = "jsonBoxed"
