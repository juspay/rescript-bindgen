@module("demo") @react.component
external make: (
  ~cmd: EnumCaseCollisionTypes.pathCmd=?,
) => React.element = "Widget"
