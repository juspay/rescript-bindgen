type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  value: float,
  size?: ProgressBarV2Types.progressBarV2Size,
  variant?: ProgressBarV2Types.progressBarV2Variant,
  appearance?: ProgressBarV2Types.progressBarV2Appearance,
  showLabel?: bool,
  min?: float,
  max?: float,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ProgressBarV2"
