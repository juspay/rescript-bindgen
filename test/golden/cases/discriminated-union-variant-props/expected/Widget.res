@module("demo") @react.component
external make: (
  ~kind: DiscriminatedUnionVariantPropsTypes.discriminatedUnionVariantPropsKind,
  ~payload: 'b=?,
  ~value: string=?,
) => React.element = "Widget"
