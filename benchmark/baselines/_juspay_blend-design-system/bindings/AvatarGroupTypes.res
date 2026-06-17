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
type avatarGroupMarginLeftConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarGroupContainerConfig = {
  marginLeft: avatarGroupMarginLeftConfig,
}
type avatarGroupSelectedConfig = {
  ringColor?: string,
  ringWidth?: string,
  ringOffset?: string,
}
type avatarGroupBorderConfig = {
  width?: string,
  color?: string,
}
type avatarGroupAvatarConfig = {
  selected: avatarGroupSelectedConfig,
  border: avatarGroupBorderConfig,
}
type avatarGroupBackgroundConfig = {
  default?: string,
  hover?: string,
  active?: string,
}
type avatarGroupTextConfig = {
  color?: string,
}
type avatarGroupSmConfig = {
  width?: string,
  height?: string,
  fontSize?: string,
}
type avatarGroupSizeConfig = {
  sm: avatarGroupSmConfig,
  regular: avatarGroupSmConfig,
  md: avatarGroupSmConfig,
  lg: avatarGroupSmConfig,
  xl: avatarGroupSmConfig,
}
type avatarGroupBorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarGroupOverflowCounterConfig = {
  background: avatarGroupBackgroundConfig,
  text: avatarGroupTextConfig,
  border: avatarGroupBorderConfig,
  size: avatarGroupSizeConfig,
  borderRadius: avatarGroupBorderRadiusConfig,
}
type avatarGroupMenuConfig = {
  marginTop?: string,
}
type avatarGroupTokensType = {
  gap?: string,
  container: avatarGroupContainerConfig,
  avatar: avatarGroupAvatarConfig,
  overflowCounter: avatarGroupOverflowCounterConfig,
  menu: avatarGroupMenuConfig,
}
type responsiveAvatarGroupTokens = {
  sm: avatarGroupTokensType,
  lg: avatarGroupTokensType,
}
