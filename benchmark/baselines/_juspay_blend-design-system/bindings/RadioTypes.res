type radioSize =
  | @as("sm") Sm
  | @as("md") Md
type maxLengthConfig2 = {
  label?: float,
  subtext?: float,
}
type groupConfig = {
  gap: string,
}
type backgroundColorConfig14 = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type activeConfig3 = {
  backgroundColor: backgroundColorConfig14,
  borderColor: backgroundColorConfig14,
}
type indicatorConfig2 = {
  active: activeConfig3,
  inactive: activeConfig3,
}
type backgroundColorConfig15 = {
  disabled: string,
  default: string,
}
type activeConfig4 = {
  backgroundColor: backgroundColorConfig15,
}
type activeIndicatorConfig2 = {
  active: activeConfig4,
}
type fontSizeConfig7 = {
  sm: string,
  md: string,
}
type labelConfig8 = {
  gap: string,
  color: backgroundColorConfig14,
  fontSize: fontSizeConfig7,
  fontWeight: fontSizeConfig7,
}
type sublabelConfig = {
  color: backgroundColorConfig14,
  fontSize: fontSizeConfig7,
  fontWeight: fontSizeConfig7,
}
type contentConfig6 = {
  label: labelConfig8,
  sublabel: sublabelConfig,
}
type activeConfig5 = {
  disabled: float,
  default: float,
  hover: float,
  error: float,
}
type borderWidthConfig = {
  active: activeConfig5,
  inactive: activeConfig5,
}
type requiredConfig5 = {
  color: string,
}
type smConfig14 = {
  gap: string,
  group: groupConfig,
  indicator: indicatorConfig2,
  activeIndicator: activeIndicatorConfig2,
  content: contentConfig6,
  height: fontSizeConfig7,
  borderWidth: borderWidthConfig,
  slot: fontSizeConfig7,
  required: requiredConfig5,
}
type responsiveRadioTokens = {
  sm: smConfig14,
  lg: smConfig14,
}
