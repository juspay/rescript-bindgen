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
type avatarAvatarTokensTypeContainerSizeConfig = {
  sm: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; }`
  regular: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; }`
  md: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; }`
  lg: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; }`
  xl: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; }`
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
type avatarAvatarTokensTypeIndicatorConfig = {
  backgroundColor: avatarAvatarTokensTypeTextColorConfig,
  border: avatarAvatarTokensTypeContainerSizeConfig,
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
