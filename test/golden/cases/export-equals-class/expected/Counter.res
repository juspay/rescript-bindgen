type t = InstanceTypes.counter
// ⚠️ `Counter` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = Counter` (CJS), this may need a hand-adjustment; verify the import at runtime.
@new @module("demo") external make: (~start: float) => t = "default"
@send external increment: (t, ~by: float) => t = "increment"
@get external value: t => float = "value"
