@module("demo") @react.component
external make: (
  ~onPoint: ObjectConfigUnionTypes.ObjectConfigUnionOnPoint.t=?,  // ⓘ was `object | OnPointOptions` — opaque; build with ObjectConfigUnionOnPoint.fromJSON / ObjectConfigUnionOnPoint.fromOnPointOptions
  ~solo: JSON.t=?,
  ~label: CommonTypes.stringOrValue=?,
) => React.element = "Series"
