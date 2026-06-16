type checkboxSize =
  | @as("sm") Sm
  | @as("md") Md
type maxLengthConfig = {
  label?: float,
  subtext?: float,
}
type slotConfig5 = {
  marginLeft: string,
}
type widthConfig3 = {
  sm: string,
  md: string,
}
type checkedConfig = {
  default?: string,
  hover?: string,
  disabled?: string,
  error?: string,
}
type backgroundColorConfig17 = {
  checked?: checkedConfig,
  unchecked?: checkedConfig,
  indeterminate?: checkedConfig,
}
type checkedConfig2 = {
  default?: string,
  disabled?: string,
}
type colorConfig16 = {
  checked?: checkedConfig2,
  unchecked?: checkedConfig2,
  indeterminate?: checkedConfig2,
}
type iconConfig5 = {
  color: colorConfig16,
  width: widthConfig3,
  height: widthConfig3,
  strokeWidth: widthConfig3,
}
type indicatorConfig3 = {
  width: widthConfig3,
  height: widthConfig3,
  backgroundColor: backgroundColorConfig17,
  borderRadius: widthConfig3,
  border: backgroundColorConfig17,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: iconConfig5,
}
type colorConfig17 = {
  default: string,
  hover: string,
  disabled: string,
  error: string,
}
type labelConfig10 = {
  color: colorConfig17,
  fontSize: widthConfig3,
  fontWeight: widthConfig3,
  lineHeight: widthConfig3,
}
type subtextConfig3 = {
  color: colorConfig17,
  fontSize: widthConfig3,
  fontWeight: widthConfig3,
}
type contentConfig8 = {
  gap: string,
  label: labelConfig10,
  subtext: subtextConfig3,
}
type requiredConfig7 = {
  color: string,
}
type checkboxTokensType = {
  gap: string,
  slot: slotConfig5,
  indicator: indicatorConfig3,
  content: contentConfig8,
  required: requiredConfig7,
}
type responsiveCheckboxTokens = {
  sm: checkboxTokensType,
  lg: checkboxTokensType,
}
