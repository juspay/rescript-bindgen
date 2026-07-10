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
type avatarAvatarTokensTypeContainerSizeSmConfig = {
  width: string,
  height: string,
}
type avatarAvatarTokensTypeContainerSizeConfig = {
  sm: avatarAvatarTokensTypeContainerSizeSmConfig,
  regular: avatarAvatarTokensTypeContainerSizeSmConfig,
  md: avatarAvatarTokensTypeContainerSizeSmConfig,
  lg: avatarAvatarTokensTypeContainerSizeSmConfig,
  xl: avatarAvatarTokensTypeContainerSizeSmConfig,
}
type avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig = {
  default: string,
  online: string,
}
type avatarAvatarTokensTypeContainerBackgroundColorConfig = {
  withImage: avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig,
  withoutImage: avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig,
}
type avatarAvatarTokensTypeContainerBorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarAvatarTokensTypeContainerConfig = {
  size: avatarAvatarTokensTypeContainerSizeConfig,
  backgroundColor: avatarAvatarTokensTypeContainerBackgroundColorConfig,
  border: avatarAvatarTokensTypeContainerBackgroundColorConfig,
  borderRadius: avatarAvatarTokensTypeContainerBorderRadiusConfig,
}
type avatarAvatarTokensTypeTextFontSizeConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarAvatarTokensTypeTextConfig = {
  color: avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig,
  fontSize: avatarAvatarTokensTypeTextFontSizeConfig,
  fontWeight: avatarAvatarTokensTypeTextFontSizeConfig,
}
type avatarAvatarTokensTypeIndicatorBorderSmDefaultConfig = {
  color: string,
  width: string,
}
type avatarAvatarTokensTypeIndicatorBorderSmConfig = {
  default: avatarAvatarTokensTypeIndicatorBorderSmDefaultConfig,
  online: avatarAvatarTokensTypeIndicatorBorderSmDefaultConfig,
}
type avatarAvatarTokensTypeIndicatorBorderConfig = {
  sm: avatarAvatarTokensTypeIndicatorBorderSmConfig,
  regular: avatarAvatarTokensTypeIndicatorBorderSmConfig,
  md: avatarAvatarTokensTypeIndicatorBorderSmConfig,
  lg: avatarAvatarTokensTypeIndicatorBorderSmConfig,
  xl: avatarAvatarTokensTypeIndicatorBorderSmConfig,
}
type avatarAvatarTokensTypeIndicatorConfig = {
  backgroundColor: avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig,
  border: avatarAvatarTokensTypeIndicatorBorderConfig,
  size: avatarAvatarTokensTypeContainerSizeConfig,
  borderRadius: string,
  boxShadow: string,
}
type avatarAvatarTokensTypeSlotConfig = {
  spacing: string,
  color: avatarAvatarTokensTypeContainerBackgroundColorWithImageConfig,
}
type avatarTokensType = {
  gap: string,
  container: avatarAvatarTokensTypeContainerConfig,
  text: avatarAvatarTokensTypeTextConfig,
  indicator: avatarAvatarTokensTypeIndicatorConfig,
  slot: avatarAvatarTokensTypeSlotConfig,
}
type responsiveAvatarTokens = {
  sm: avatarTokensType,
  lg: avatarTokensType,
}
type avatarSkeletonConfig = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
