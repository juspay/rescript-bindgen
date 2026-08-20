type avatarGroupAvatarGroupTokensTypeContainerMarginLeftConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarGroupAvatarGroupTokensTypeContainerConfig = {
  marginLeft: avatarGroupAvatarGroupTokensTypeContainerMarginLeftConfig,
}
type avatarGroupAvatarGroupTokensTypeAvatarSelectedConfig = {
  ringColor: string,
  ringWidth: string,
  ringOffset: string,
  outlineColor: string,
}
type avatarGroupAvatarGroupTokensTypeAvatarBorderConfig = {
  width: string,
  color: string,
}
type avatarGroupAvatarGroupTokensTypeAvatarConfig = {
  selected: avatarGroupAvatarGroupTokensTypeAvatarSelectedConfig,
  border: avatarGroupAvatarGroupTokensTypeAvatarBorderConfig,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterBackgroundConfig = {
  default: string,
  hover: string,
  active: string,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterTextConfig = {
  color: string,
}
type __typeV1y96o = {
  width: string,
  height: string,
  fontSize: string,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterSizeConfig = {
  sm: __typeV1y96o,
  regular: __typeV1y96o,
  md: __typeV1y96o,
  lg: __typeV1y96o,
  xl: __typeV1y96o,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterBorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterConfig = {
  background: avatarGroupAvatarGroupTokensTypeOverflowCounterBackgroundConfig,
  text: avatarGroupAvatarGroupTokensTypeOverflowCounterTextConfig,
  border: avatarGroupAvatarGroupTokensTypeAvatarBorderConfig,
  size: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeConfig,
  borderRadius: avatarGroupAvatarGroupTokensTypeOverflowCounterBorderRadiusConfig,
}
type avatarGroupAvatarGroupTokensTypeMenuConfig = {
  marginTop: string,
}
type avatarGroupTokensType = {
  gap: string,
  container: avatarGroupAvatarGroupTokensTypeContainerConfig,
  avatar: avatarGroupAvatarGroupTokensTypeAvatarConfig,
  overflowCounter: avatarGroupAvatarGroupTokensTypeOverflowCounterConfig,
  menu: avatarGroupAvatarGroupTokensTypeMenuConfig,
}
type responsiveAvatarGroupTokens = {
  sm: avatarGroupTokensType,
  lg: avatarGroupTokensType,
}
type avatarData = {
  id: CommonTypes.stringOrNumber,
  alt?: string,
  fallback?: React.element,
  size?: AvatarTypes.avatarSize,
  src?: string,
  online?: bool,
  shape?: AvatarTypes.avatarShape,
  skeleton?: AvatarTypes.avatarSkeletonConfig,
  onlinePosition?: AvatarTypes.avatarOnlinePosition,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
}
type avatarGroupSkeletonConfig = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
