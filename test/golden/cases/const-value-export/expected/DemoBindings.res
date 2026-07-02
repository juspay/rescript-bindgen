@module("demo") external themeTokens: ConstValueExportTypes.constValueExportTHEMETOKENSConfig = "THEME_TOKENS"
@module("demo") external defaultConfig: ConstValueExportTypes.settings = "defaultConfig"
@module("demo") external version: string = "VERSION"
// ⚠️ `LIMITS` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = LIMITS` (CJS), this may need a hand-adjustment; verify the import at runtime.
@module("demo") external limits: ConstValueExportTypes.constValueExportLIMITSConfig = "default"
