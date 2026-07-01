type avatarData = {
  id: CommonTypes.stringOrNumber,
  alt?: string,
  fallback?: React.element,
  size?: AvatarTypes.avatarSize,
  shape?: AvatarTypes.avatarShape,
  online?: bool,
  src?: string,
  onlinePosition?: AvatarTypes.avatarOnlinePosition,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  skeleton?: AvatarTypes.avatarSkeletonConfig,
}
type avatarGroupSkeletonConfig = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
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
type avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig = {
  width: string,
  height: string,
  fontSize: string,
}
type avatarGroupAvatarGroupTokensTypeOverflowCounterSizeConfig = {
  sm: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig,
  regular: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig,
  md: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig,
  lg: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig,
  xl: avatarGroupAvatarGroupTokensTypeOverflowCounterSizeSmConfig,
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
