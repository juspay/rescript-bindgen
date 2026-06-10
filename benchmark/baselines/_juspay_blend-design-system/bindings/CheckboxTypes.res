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
type checkedConfig = {
  default?: string,
  hover?: string,
  disabled?: string,
  error?: string,
}
type backgroundColorConfig14 = {
  checked?: checkedConfig,
  unchecked?: checkedConfig,
  indeterminate?: checkedConfig,
}
type checkedConfig2 = {
  default?: string,
  disabled?: string,
}
type colorConfig15 = {
  checked?: checkedConfig2,
  unchecked?: checkedConfig2,
  indeterminate?: checkedConfig2,
}
type iconConfig5 = {
  color: colorConfig15,
  width: RadioTypes.fontSizeConfig5,
  height: RadioTypes.fontSizeConfig5,
  strokeWidth: RadioTypes.fontSizeConfig5,
}
type indicatorConfig3 = {
  width: RadioTypes.fontSizeConfig5,
  height: RadioTypes.fontSizeConfig5,
  backgroundColor: backgroundColorConfig14,
  borderRadius: RadioTypes.fontSizeConfig5,
  border: backgroundColorConfig14,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: iconConfig5,
}
type colorConfig16 = {
  default: string,
  hover: string,
  disabled: string,
  error: string,
}
type labelConfig7 = {
  color: colorConfig16,
  fontSize: RadioTypes.fontSizeConfig5,
  fontWeight: RadioTypes.fontSizeConfig5,
  lineHeight: RadioTypes.fontSizeConfig5,
}
type subtextConfig2 = {
  color: colorConfig16,
  fontSize: RadioTypes.fontSizeConfig5,
  fontWeight: RadioTypes.fontSizeConfig5,
}
type contentConfig7 = {
  gap: string,
  label: labelConfig7,
  subtext: subtextConfig2,
}
type checkboxTokensType = {
  gap: string,
  slot: slotConfig5,
  indicator: indicatorConfig3,
  content: contentConfig7,
  required: AvatarGroupTypes.textConfig7,
}
type responsiveCheckboxTokens = {
  sm: checkboxTokensType,
  lg: checkboxTokensType,
}
