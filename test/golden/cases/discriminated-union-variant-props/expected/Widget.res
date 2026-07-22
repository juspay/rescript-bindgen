type props<'b> = {
  kind: DiscriminatedUnionVariantPropsTypes.discriminatedUnionVariantPropsKind,
  payload?: 'b,
  value?: string,
}

@module("demo")
external make: React.component<props<'b>> = "Widget"
