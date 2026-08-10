type t = InstanceTypes.req
@new @module("demo") external make: unit => t = "Req"
@send external jsonBoxed: (t) => GenericInstantiationDistinctTypes.boxOf = "jsonBoxed"
