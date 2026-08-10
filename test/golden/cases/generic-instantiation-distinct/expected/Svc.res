type t = InstanceTypes.svc
@new @module("demo") external make: unit => t = "Svc"
// 🛑 BROKEN: `gen` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external gen: (t, ~x: string) => GenericInstantiationDistinctTypes.pairV1spt2 = "gen"
@send external concrete: (t) => GenericInstantiationDistinctTypes.pairV1o117 = "concrete"
