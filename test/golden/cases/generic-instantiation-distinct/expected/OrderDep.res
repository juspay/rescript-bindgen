type t = InstanceTypes.orderDep
@new @module("demo") external make: unit => t = "OrderDep"
// ⚪ loose: `ambiguous` has a param/return widened to `string`.
@send external ambiguous: (t, ~name: string) => GenericInstantiationDistinctTypes.ordTaggedZpk12 = "ambiguous"
@send external unambiguous: (t) => GenericInstantiationDistinctTypes.ordTaggedTp6gq = "unambiguous"
