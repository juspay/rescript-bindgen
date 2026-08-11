@module("demo") external takeFnArms: (array<GenericInstantiationDistinctTypes.FnArms.t>) => unit = "takeFnArms"
@module("demo") external takeSharedArms: (array<GenericInstantiationDistinctTypes.SharedArms.t>) => unit = "takeSharedArms"
// ⚪ loose: `fnDigit` has a param/return widened to `string`.
@module("demo") external fnDigit: (string) => string = "fnDigit"
// ⚪ loose: `fnDigitForName` has a param/return widened to `string`.
@module("demo") external fnDigitForName: (string) => string = "fnDigit"
