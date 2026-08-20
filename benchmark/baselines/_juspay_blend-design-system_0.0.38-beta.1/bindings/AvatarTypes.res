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
type __typeV44l1h2 = {
  width: string,
  height: string,
}
type avatarAvatarTokensTypeContainerSizeConfig = {
  sm: __typeV44l1h2,
  regular: __typeV44l1h2,
  md: __typeV44l1h2,
  lg: __typeV44l1h2,
  xl: __typeV44l1h2,
}
type avatarAvatarTokensTypeTextColorConfig = {
  default: string,
  online: string,
}
type avatarAvatarTokensTypeContainerBackgroundColorConfig = {
  withImage: avatarAvatarTokensTypeTextColorConfig,
  withoutImage: avatarAvatarTokensTypeTextColorConfig,
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
  color: avatarAvatarTokensTypeTextColorConfig,
  fontSize: avatarAvatarTokensTypeTextFontSizeConfig,
  fontWeight: avatarAvatarTokensTypeTextFontSizeConfig,
}
type avatarUseThemeSmDefaultConfig = {
  color: string,
  width: string,
}
type avatarUseThemeSmConfig = {
  default: avatarUseThemeSmDefaultConfig,
  online: avatarUseThemeSmDefaultConfig,
}
type avatarAvatarTokensTypeIndicatorBorderConfig = {
  sm: avatarUseThemeSmConfig,
  regular: avatarUseThemeSmConfig,
  md: avatarUseThemeSmConfig,
  lg: avatarUseThemeSmConfig,
  xl: avatarUseThemeSmConfig,
}
type avatarAvatarTokensTypeIndicatorConfig = {
  backgroundColor: avatarAvatarTokensTypeTextColorConfig,
  border: avatarAvatarTokensTypeIndicatorBorderConfig,
  size: avatarAvatarTokensTypeContainerSizeConfig,
  borderRadius: string,
  boxShadow: string,
}
type avatarAvatarTokensTypeSlotConfig = {
  spacing: string,
  color: avatarAvatarTokensTypeTextColorConfig,
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
