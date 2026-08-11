type t = InstanceTypes.svc
@new @module("demo") external make: unit => t = "Svc"
@send external gen: (t, ~x: 'a) => GenericInstantiationDistinctTypes.pairRy8eg<'a> = "gen"
// 🛑 BROKEN: `constrained` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external constrained: (t, ~s: string) => GenericInstantiationDistinctTypes.pairV1spt2 = "constrained"
@send external concrete: (t) => GenericInstantiationDistinctTypes.pairV1o117 = "concrete"
// 🛑 BROKEN: `returnOnly` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external returnOnly: (t) => string = "returnOnly"
@send external mixed: (t, ~a: 'a) => GenericInstantiationDistinctTypes.pairRy8eg<'a> = "mixed"
