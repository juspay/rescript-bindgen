type avatarData = {
  ...JsxDOM.domProps,
  fallback?: React.element,
  online?: bool,
  onlinePosition?: AvatarTypes.avatarOnlinePosition,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  skeleton?: AvatarTypes.skeletonConfig,
}
type skeletonConfig2 = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type marginLeftConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type containerConfig3 = {
  marginLeft: marginLeftConfig,
}
type selectedConfig = {
  ringColor: string,
  ringWidth: string,
  ringOffset: string,
}
type borderConfig3 = {
  width: string,
  color: string,
}
type avatarConfig = {
  selected: selectedConfig,
  border: borderConfig3,
}
type backgroundConfig2 = {
  default: string,
  hover: string,
  active: string,
}
type textConfig7 = {
  color: string,
}
type smConfig6 = {
  width: string,
  height: string,
  fontSize: string,
}
type sizeConfig3 = {
  sm: smConfig6,
  regular: smConfig6,
  md: smConfig6,
  lg: smConfig6,
  xl: smConfig6,
}
type borderRadiusConfig5 = {
  circular: string,
  rounded: string,
}
type overflowCounterConfig = {
  background: backgroundConfig2,
  text: textConfig7,
  border: borderConfig3,
  size: sizeConfig3,
  borderRadius: borderRadiusConfig5,
}
type menuConfig = {
  marginTop: string,
}
type avatarGroupTokensType = {
  gap: string,
  container: containerConfig3,
  avatar: avatarConfig,
  overflowCounter: overflowCounterConfig,
  menu: menuConfig,
}
type responsiveAvatarGroupTokens = {
  sm: avatarGroupTokensType,
  lg: avatarGroupTokensType,
}
