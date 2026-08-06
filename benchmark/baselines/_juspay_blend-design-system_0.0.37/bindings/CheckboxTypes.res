type checkboxSize =
  | @as("sm") Sm
  | @as("md") Md
type checkboxCheckboxTokensTypeSlotConfig = {
  marginLeft: string,
}
type checkboxCheckboxTokensTypeIndicatorWidthConfig = {
  sm: string,
  md: string,
}
type checkboxCheckboxTokensTypeIndicatorBackgroundColorCheckedConfig = {
  default?: string,
  hover?: string,
  disabled?: string,
  error?: string,
}
type checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig = {
  checked?: checkboxCheckboxTokensTypeIndicatorBackgroundColorCheckedConfig,
  unchecked?: checkboxCheckboxTokensTypeIndicatorBackgroundColorCheckedConfig,
  indeterminate?: checkboxCheckboxTokensTypeIndicatorBackgroundColorCheckedConfig,
}
type checkboxCheckboxTokensTypeIndicatorIconColorCheckedConfig = {
  default?: string,
  disabled?: string,
}
type checkboxCheckboxTokensTypeIndicatorIconColorConfig = {
  checked?: checkboxCheckboxTokensTypeIndicatorIconColorCheckedConfig,
  unchecked?: checkboxCheckboxTokensTypeIndicatorIconColorCheckedConfig,
  indeterminate?: checkboxCheckboxTokensTypeIndicatorIconColorCheckedConfig,
}
type checkboxCheckboxTokensTypeIndicatorIconConfig = {
  color: checkboxCheckboxTokensTypeIndicatorIconColorConfig,
  width: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  height: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  strokeWidth: checkboxCheckboxTokensTypeIndicatorWidthConfig,
}
type checkboxCheckboxTokensTypeIndicatorConfig = {
  width: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  height: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  backgroundColor: checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig,
  borderRadius: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  border: checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: checkboxCheckboxTokensTypeIndicatorIconConfig,
}
type checkboxCheckboxTokensTypeContentLabelColorConfig = {
  default: string,
  hover: string,
  disabled: string,
  error: string,
}
type checkboxCheckboxTokensTypeContentLabelConfig = {
  color: checkboxCheckboxTokensTypeContentLabelColorConfig,
  fontSize: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  fontWeight: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  lineHeight: checkboxCheckboxTokensTypeIndicatorWidthConfig,
}
type checkboxCheckboxTokensTypeContentSubtextConfig = {
  color: checkboxCheckboxTokensTypeContentLabelColorConfig,
  fontSize: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  fontWeight: checkboxCheckboxTokensTypeIndicatorWidthConfig,
}
type checkboxCheckboxTokensTypeContentConfig = {
  gap: string,
  label: checkboxCheckboxTokensTypeContentLabelConfig,
  subtext: checkboxCheckboxTokensTypeContentSubtextConfig,
}
type checkboxCheckboxTokensTypeRequiredConfig = {
  color: string,
}
type checkboxTokensType = {
  gap: string,
  slot: checkboxCheckboxTokensTypeSlotConfig,
  indicator: checkboxCheckboxTokensTypeIndicatorConfig,
  content: checkboxCheckboxTokensTypeContentConfig,
  required: checkboxCheckboxTokensTypeRequiredConfig,
}
type responsiveCheckboxTokens = {
  sm: checkboxTokensType,
  lg: checkboxTokensType,
}
type checkboxCheckboxPropsMaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type checkboxProps = {
  label?: string,
  id?: string,
  name?: string,
  checked?: CommonTypes.boolOrIndeterminate,
  defaultChecked?: bool,
  onCheckedChange?: CommonTypes.boolOrIndeterminate => unit,
  disabled?: bool,
  required?: bool,
  error?: bool,
  size?: checkboxSize,
  children?: React.element,
  subtext?: string,
  slot?: React.element,
  maxLength?: checkboxCheckboxPropsMaxLengthConfig,
}
