@module("demo") external takeFnArms: (array<GenericInstantiationDistinctTypes.FnArms.t>) => unit = "takeFnArms"
@module("demo") external takeSharedArms: (array<GenericInstantiationDistinctTypes.SharedArms.t>) => unit = "takeSharedArms"
