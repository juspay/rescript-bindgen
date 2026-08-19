// #65: discriminated-union props — per-branch requiredness preserved. Render with
//      React.createElement(make, First({…})). `kind` is auto-filled by @tag.
@tag("kind")
type props =
  | @as("first") First({data: VariantPropsShadowedBranchFieldTypes.foo})
  | @as("second") Second({data: VariantPropsShadowedBranchFieldTypes.bar})

@module("demo")
external make: props => React.element = "Widget"
