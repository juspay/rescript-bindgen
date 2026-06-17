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
type avatarSkeletonConfig = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type avatarSmConfig = {
  width: string,
  height: string,
}
type avatarSizeConfig = {
  sm: avatarSmConfig,
  regular: avatarSmConfig,
  md: avatarSmConfig,
  lg: avatarSmConfig,
  xl: avatarSmConfig,
}
type avatarWithImageConfig = {
  default: string,
  online: string,
}
type avatarBackgroundColorConfig = {
  withImage: avatarWithImageConfig,
  withoutImage: avatarWithImageConfig,
}
type avatarBorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarContainerConfig = {
  size: avatarSizeConfig,
  backgroundColor: avatarBackgroundColorConfig,
  border: avatarBackgroundColorConfig,
  borderRadius: avatarBorderRadiusConfig,
}
type avatarFontSizeConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarTextConfig = {
  color: avatarWithImageConfig,
  fontSize: avatarFontSizeConfig,
  fontWeight: avatarFontSizeConfig,
}
type avatarDefaultConfig = {
  color: string,
  width: string,
}
type avatarSmConfig2 = {
  default: avatarDefaultConfig,
  online: avatarDefaultConfig,
}
type avatarBorderConfig = {
  sm: avatarSmConfig2,
  regular: avatarSmConfig2,
  md: avatarSmConfig2,
  lg: avatarSmConfig2,
  xl: avatarSmConfig2,
}
type avatarIndicatorConfig = {
  backgroundColor: avatarWithImageConfig,
  border: avatarBorderConfig,
  size: avatarSizeConfig,
  borderRadius: string,
  boxShadow: string,
}
type avatarSlotConfig = {
  spacing: string,
  color: avatarWithImageConfig,
}
type avatarTokensType = {
  gap: string,
  container: avatarContainerConfig,
  text: avatarTextConfig,
  indicator: avatarIndicatorConfig,
  slot: avatarSlotConfig,
}
type responsiveAvatarTokens = {
  sm: avatarTokensType,
  lg: avatarTokensType,
}
