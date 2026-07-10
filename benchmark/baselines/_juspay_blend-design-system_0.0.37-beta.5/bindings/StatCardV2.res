type props<'a, 'b, 'c> = {
  ...HtmlAttrs.htmlAttributesOmitTitle,
  ...StatCardV2Types.statCardV2Dimensions,
  title: string,
  variant?: StatCardV2Types.statCardV2Variant,
  titleIcon?: React.element,
  actionIcon?: React.element,
  value?: string,
  progressValue?: float,
  helpIconText?: string,
  change?: StatCardV2Types.statCardV2Change,
  subtitle?: string,
  options?: HighchartsSharedTypes.options<'a, 'b, 'c>,
  skeleton?: StatCardV2Types.statCardV2SkeletonProps,
  dropdownProps?: SingleSelectTypes.singleSelectProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c>> = "StatCardV2"
