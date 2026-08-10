type t = InstanceTypes.api
@new @module("demo") external make: unit => t = "Api"
@send external body: (t, ~data: 'a) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigV31qow<'a> = "body"
@send external text: (t, ~t: string) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigVd30b = "text"
@send external redirect: (t, ~location: string) => GenericInstantiationDistinctTypes.genericInstantiationDistinctValueConfigV3fyyt = "redirect"
