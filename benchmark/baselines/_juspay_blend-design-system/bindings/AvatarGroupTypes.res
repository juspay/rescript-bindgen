type avatarData = {
  ...JsxDOM.domProps,
  fallback?: React.element,
  online?: bool,
  onlinePosition?: AvatarTypes.avatarOnlinePosition,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  skeleton?: AvatarTypes.skeletonConfig,
}
type containerConfig3 = {
  marginLeft: AvatarTypes.fontSizeConfig3,
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
type overflowCounterConfig = {
  background: BreadcrumbTypes.colorConfig3,
  text: textConfig7,
  border: borderConfig3,
  size: sizeConfig3,
  borderRadius: AvatarTypes.borderRadiusConfig4,
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
@unboxed type stringOrTextConfig7 = Str(string) | TextConfig7(textConfig7)
