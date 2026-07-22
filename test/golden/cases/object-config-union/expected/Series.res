type props = {
  onPoint?: ObjectConfigUnionTypes.ObjectConfigUnionOnPoint.t,  // ⓘ was `object | OnPointOptions` — opaque; build with ObjectConfigUnionOnPoint.fromJSON / ObjectConfigUnionOnPoint.fromOnPointOptions
  solo?: JSON.t,
  label?: CommonTypes.stringOrValue,
}

@module("demo")
external make: React.component<props> = "Series"
