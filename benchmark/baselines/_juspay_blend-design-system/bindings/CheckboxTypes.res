type checkboxSize =
  | @as("sm") Sm
  | @as("md") Md
type checkboxMaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type checkboxSlotConfig = {
  marginLeft: string,
}
type checkboxWidthConfig = {
  sm: string,
  md: string,
}
type checkboxCheckedConfig = {
  default?: string,
  hover?: string,
  disabled?: string,
  error?: string,
}
type checkboxBackgroundColorConfig = {
  checked?: checkboxCheckedConfig,
  unchecked?: checkboxCheckedConfig,
  indeterminate?: checkboxCheckedConfig,
}
type checkboxCheckedConfig2 = {
  default?: string,
  disabled?: string,
}
type checkboxColorConfig = {
  checked?: checkboxCheckedConfig2,
  unchecked?: checkboxCheckedConfig2,
  indeterminate?: checkboxCheckedConfig2,
}
type checkboxIconConfig = {
  color: checkboxColorConfig,
  width: checkboxWidthConfig,
  height: checkboxWidthConfig,
  strokeWidth: checkboxWidthConfig,
}
type checkboxIndicatorConfig = {
  width: checkboxWidthConfig,
  height: checkboxWidthConfig,
  backgroundColor: checkboxBackgroundColorConfig,
  borderRadius: checkboxWidthConfig,
  border: checkboxBackgroundColorConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: checkboxIconConfig,
}
type checkboxColorConfig2 = {
  default: string,
  hover: string,
  disabled: string,
  error: string,
}
type checkboxLabelConfig = {
  color: checkboxColorConfig2,
  fontSize: checkboxWidthConfig,
  fontWeight: checkboxWidthConfig,
  lineHeight: checkboxWidthConfig,
}
type checkboxSubtextConfig = {
  color: checkboxColorConfig2,
  fontSize: checkboxWidthConfig,
  fontWeight: checkboxWidthConfig,
}
type checkboxContentConfig = {
  gap: string,
  label: checkboxLabelConfig,
  subtext: checkboxSubtextConfig,
}
type checkboxRequiredConfig = {
  color: string,
}
type checkboxTokensType = {
  gap: string,
  slot: checkboxSlotConfig,
  indicator: checkboxIndicatorConfig,
  content: checkboxContentConfig,
  required: checkboxRequiredConfig,
}
type responsiveCheckboxTokens = {
  sm: checkboxTokensType,
  lg: checkboxTokensType,
}
