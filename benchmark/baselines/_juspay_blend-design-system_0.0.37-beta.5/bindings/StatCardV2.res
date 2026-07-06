type props<'b> = {
  ...HtmlAttrs.htmlAttributesOmitTitle,
  title: string,
  variant?: StatCardV2Types.statCardV2Variant,
  titleIcon?: React.element,
  actionIcon?: React.element,
  value?: string,
  progressValue?: float,
  helpIconText?: string,
  change?: StatCardV2Types.statCardV2Change,
  subtitle?: string,
  options?: HighchartsSharedTypes.options<'b>,
  skeleton?: StatCardV2Types.statCardV2SkeletonProps,
  dropdownProps?: SingleSelectTypes.singleSelectProps,
  width?: string,
  maxWidth?: string,
  minWidth?: string,
  height?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'b>> = "StatCardV2"
