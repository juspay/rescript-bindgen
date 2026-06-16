type heightConfig6 = {
  sm: string,
  md: string,
  lg: string,
}
type checkedConfig3 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type backgroundColorConfig23 = {
  checked: checkedConfig3,
  unchecked: checkedConfig3,
}
type thumbConfig2 = {
  backgroundColor: string,
  border: string,
  width: heightConfig6,
  height: heightConfig6,
  outline: string,
}
type switch_Config = {
  height: heightConfig6,
  width: heightConfig6,
  backgroundColor: backgroundColorConfig23,
  thumb: thumbConfig2,
}
type maxHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type slotConfig9 = {
  maxHeight: maxHeightConfig,
}
type labelConfig12 = {
  gap: string,
  color: checkedConfig3,
  fontSize: heightConfig6,
  fontWeight: heightConfig6,
  lineHeight: heightConfig6,
  slot: slotConfig9,
}
type subLabelConfig2 = {
  color: checkedConfig3,
  fontSize: heightConfig6,
  fontWeight: heightConfig6,
  lineHeight: heightConfig6,
}
type requiredConfig8 = {
  color: string,
}
type contentConfig13 = {
  gap: string,
  label: labelConfig12,
  subLabel: subLabelConfig2,
  required: requiredConfig8,
}
type switchV2TokensType = {
  gap: string,
  @as("switch") switch_: switch_Config,
  content: contentConfig13,
}
type responsiveSwitchV2Tokens = {
  sm: switchV2TokensType,
  lg: switchV2TokensType,
}
type checkedConfig4 = {
  default?: string,
  hover?: string,
  focus?: string,
  error?: string,
  disabled?: string,
}
type backgroundColorConfig25 = {
  checked?: checkedConfig4,
  unchecked?: checkedConfig4,
  indeterminate?: checkedConfig4,
}
type checkedConfig5 = {
  default?: string,
  disabled?: string,
}
type colorConfig23 = {
  checked?: checkedConfig5,
  unchecked?: checkedConfig5,
  indeterminate?: checkedConfig5,
}
type iconConfig10 = {
  color: colorConfig23,
  width: heightConfig6,
  height: heightConfig6,
  strokeWidth: heightConfig6,
}
type checkboxConfig = {
  height: heightConfig6,
  width: heightConfig6,
  opacity: string,
  backgroundColor: backgroundColorConfig25,
  borderRadius: heightConfig6,
  border: backgroundColorConfig25,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: iconConfig10,
}
type checkboxV2TokensType = {
  gap: string,
  checkbox: checkboxConfig,
  content: contentConfig13,
}
type responsiveCheckboxV2Tokens = {
  sm: checkboxV2TokensType,
  lg: checkboxV2TokensType,
}
type groupConfig2 = {
  gap: string,
}
type backgroundColorConfig26 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type activeConfig7 = {
  backgroundColor: backgroundColorConfig26,
  borderColor: backgroundColorConfig26,
}
type indicatorConfig5 = {
  active: activeConfig7,
  inactive: activeConfig7,
}
type backgroundColorConfig27 = {
  default: string,
  focus: string,
  disabled: string,
}
type activeConfig8 = {
  backgroundColor: backgroundColorConfig27,
}
type activeIndicatorConfig3 = {
  active: activeConfig8,
}
type activeConfig9 = {
  default: float,
  hover: float,
  focus: float,
  error: float,
  disabled: float,
}
type borderWidthConfig2 = {
  active: activeConfig9,
  inactive: activeConfig9,
}
type radioConfig = {
  indicator: indicatorConfig5,
  activeIndicator: activeIndicatorConfig3,
  height: heightConfig6,
  borderWidth: borderWidthConfig2,
}
type radioV2TokensType = {
  gap: string,
  group: groupConfig2,
  radio: radioConfig,
  content: contentConfig13,
}
type responsiveRadioV2Tokens = {
  sm: radioV2TokensType,
  lg: radioV2TokensType,
}
