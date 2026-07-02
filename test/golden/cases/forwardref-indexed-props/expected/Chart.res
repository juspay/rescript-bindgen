// ⚠️ `Chart` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = Chart` (CJS), this may need a hand-adjustment; verify the import at runtime.
@module("demo") @react.component
external make: (
  ~options: ForwardrefIndexedPropsTypes.forwardrefIndexedPropsOptionsConfig=?,
  ~immutable: bool=?,
  ~onRender: string => unit=?,
) => React.element = "default"
