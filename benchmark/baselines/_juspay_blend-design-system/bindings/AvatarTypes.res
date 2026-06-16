type avatarSize =
  | @as("sm") Sm
  | @as("regular") Regular
  | @as("md") Md
  | @as("lg") Lg
  | @as("xl") Xl
type avatarShape =
  | @as("circular") Circular
  | @as("rounded") Rounded
type avatarOnlinePosition =
  | @as("top") Top
  | @as("bottom") Bottom
type skeletonConfig = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type smConfig4 = {
  width: string,
  height: string,
}
type sizeConfig2 = {
  sm: smConfig4,
  regular: smConfig4,
  md: smConfig4,
  lg: smConfig4,
  xl: smConfig4,
}
type withImageConfig = {
  default: string,
  online: string,
}
type backgroundColorConfig4 = {
  withImage: withImageConfig,
  withoutImage: withImageConfig,
}
type borderRadiusConfig4 = {
  circular: string,
  rounded: string,
}
type containerConfig2 = {
  size: sizeConfig2,
  backgroundColor: backgroundColorConfig4,
  border: backgroundColorConfig4,
  borderRadius: borderRadiusConfig4,
}
type fontSizeConfig3 = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type textConfig6 = {
  color: withImageConfig,
  fontSize: fontSizeConfig3,
  fontWeight: fontSizeConfig3,
}
type defaultConfig4 = {
  color: string,
  width: string,
}
type smConfig5 = {
  default: defaultConfig4,
  online: defaultConfig4,
}
type borderConfig2 = {
  sm: smConfig5,
  regular: smConfig5,
  md: smConfig5,
  lg: smConfig5,
  xl: smConfig5,
}
type indicatorConfig = {
  backgroundColor: withImageConfig,
  border: borderConfig2,
  size: sizeConfig2,
  borderRadius: string,
  boxShadow: string,
}
type slotConfig = {
  spacing: string,
  color: withImageConfig,
}
type avatarTokensType = {
  gap: string,
  container: containerConfig2,
  text: textConfig6,
  indicator: indicatorConfig,
  slot: slotConfig,
}
type responsiveAvatarTokens = {
  sm: avatarTokensType,
  lg: avatarTokensType,
}
