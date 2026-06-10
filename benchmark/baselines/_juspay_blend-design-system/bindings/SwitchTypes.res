type switchSize =
  | @as("sm") Sm
  | @as("md") Md
type backgroundColorConfig13 = {
  active: RadioTypes.backgroundColorConfig11,
  inactive: RadioTypes.backgroundColorConfig11,
}
type borderConfig8 = {
  color: string,
  width: string,
}
type smConfig13 = {
  width: string,
  height: string,
  top: string,
  left: string,
  offset: string,
}
type sizeConfig4 = {
  sm: smConfig13,
  md: smConfig13,
}
type thumbConfig = {
  backgroundColor: string,
  border: borderConfig8,
  borderRadius: RadioTypes.fontSizeConfig5,
  size: sizeConfig4,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
}
type switchContainerConfig = {
  height: RadioTypes.fontSizeConfig5,
  width: RadioTypes.fontSizeConfig5,
  borderRadius: RadioTypes.fontSizeConfig5,
  backgroundColor: backgroundColorConfig13,
  thumb: thumbConfig,
}
type labelConfig6 = {
  color: RadioTypes.backgroundColorConfig11,
  fontSize: RadioTypes.fontSizeConfig5,
  fontWeight: RadioTypes.fontSizeConfig5,
  gap: string,
}
type contentConfig6 = {
  label: labelConfig6,
  subtext: RadioTypes.sublabelConfig,
  gap: string,
}
type slotConfig4 = {
  width: RadioTypes.fontSizeConfig5,
  height: RadioTypes.fontSizeConfig5,
}
type switchTokensType = {
  gap: string,
  switchContainer: switchContainerConfig,
  content: contentConfig6,
  required: AvatarGroupTypes.textConfig7,
  slot: slotConfig4,
}
type responsiveSwitchTokens = {
  sm: switchTokensType,
  lg: switchTokensType,
}
