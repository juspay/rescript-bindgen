@module("demo") external helper: (float) => float = "helper"
// ⚠️ `greet` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = greet` (CJS), this may need a hand-adjustment; verify the import at runtime.
@module("demo") external greet: (string) => string = "default"
