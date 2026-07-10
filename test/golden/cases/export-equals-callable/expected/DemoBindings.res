@module("demo") external bind: (string) => string => string = "bind"
// ⚠️ `cx` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = cx` (CJS), this may need a hand-adjustment; verify the import at runtime.
@module("demo") external cx: (string) => string = "default"
