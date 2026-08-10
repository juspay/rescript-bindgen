type t = InstanceTypes.api
@new @module("demo") external make: unit => t = "Api"
// 🛑 BROKEN: `body` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external body: (t, ~data: string) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigV1bq7o = "body"
@send external text: (t, ~t: string) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigVd30b = "text"
@send external redirect: (t, ~location: string) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigV3fyyt = "redirect"
