type radioSize =
  | @as("sm") Sm
  | @as("md") Md
type backgroundColorConfig11 = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type activeConfig3 = {
  backgroundColor: backgroundColorConfig11,
  borderColor: backgroundColorConfig11,
}
type indicatorConfig2 = {
  active: activeConfig3,
  inactive: activeConfig3,
}
type backgroundColorConfig12 = {
  disabled: string,
  default: string,
}
type activeConfig4 = {
  backgroundColor: backgroundColorConfig12,
}
type activeIndicatorConfig2 = {
  active: activeConfig4,
}
type fontSizeConfig5 = {
  sm: string,
  md: string,
}
type labelConfig5 = {
  gap: string,
  color: backgroundColorConfig11,
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
}
type sublabelConfig = {
  color: backgroundColorConfig11,
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
}
type contentConfig5 = {
  label: labelConfig5,
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
type smConfig12 = {
  gap: string,
  group: ChartsTypes.slotsConfig,
  indicator: indicatorConfig2,
  activeIndicator: activeIndicatorConfig2,
  content: contentConfig5,
  height: fontSizeConfig5,
  borderWidth: borderWidthConfig,
  slot: fontSizeConfig5,
  required: AvatarGroupTypes.textConfig7,
}
type responsiveRadioTokens = {
  sm: smConfig12,
  lg: smConfig12,
}
