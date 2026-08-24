type t = InstanceTypes.registry
@new @module("demo") external make: unit => t = "Registry"
@send external register: (t, ~state: ConstrainedTypeParamBoundTypes.constrainedTypeParamBoundValue) => unit = "register"
@send external passThrough: (t, ~value: 'a) => 'a = "passThrough"
@module("demo") @scope("Registry") external of_: (~raw: string) => unit = "of"
