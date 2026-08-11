type t = InstanceTypes.ctorOverload
// ⚪ loose: `make` has a param/return widened to `string`.
@new @module("demo") external make: (~kind: string, ~n: float=?, unit) => t = "CtorOverload"
