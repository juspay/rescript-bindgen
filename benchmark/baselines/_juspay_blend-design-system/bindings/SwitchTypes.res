type switchSize =
  | @as("sm") Sm
  | @as("md") Md
type maxLengthConfig3 = {
  label?: float,
  subtext?: float,
}
type heightConfig4 = {
  sm: string,
  md: string,
}
type activeConfig6 = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type backgroundColorConfig16 = {
  active: activeConfig6,
  inactive: activeConfig6,
}
type borderConfig10 = {
  color: string,
  width: string,
}
type smConfig15 = {
  width: string,
  height: string,
  top: string,
  left: string,
  offset: string,
}
type sizeConfig4 = {
  sm: smConfig15,
  md: smConfig15,
}
type thumbConfig = {
  backgroundColor: string,
  border: borderConfig10,
  borderRadius: heightConfig4,
  size: sizeConfig4,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
}
type switchContainerConfig = {
  height: heightConfig4,
  width: heightConfig4,
  borderRadius: heightConfig4,
  backgroundColor: backgroundColorConfig16,
  thumb: thumbConfig,
}
type labelConfig9 = {
  color: activeConfig6,
  fontSize: heightConfig4,
  fontWeight: heightConfig4,
  gap: string,
}
type subtextConfig2 = {
  color: activeConfig6,
  fontSize: heightConfig4,
  fontWeight: heightConfig4,
}
type contentConfig7 = {
  label: labelConfig9,
  subtext: subtextConfig2,
  gap: string,
}
type requiredConfig6 = {
  color: string,
}
type slotConfig4 = {
  width: heightConfig4,
  height: heightConfig4,
}
type switchTokensType = {
  gap: string,
  switchContainer: switchContainerConfig,
  content: contentConfig7,
  required: requiredConfig6,
  slot: slotConfig4,
}
type responsiveSwitchTokens = {
  sm: switchTokensType,
  lg: switchTokensType,
}
