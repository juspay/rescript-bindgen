// ⚠️ `Chart` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = Chart` (CJS), this may need a hand-adjustment; verify the import at runtime.
type props = {
  ...ForwardrefIndexedPropsTypes.chartProps,
}

@module("demo")
external make: React.component<props> = "default"
