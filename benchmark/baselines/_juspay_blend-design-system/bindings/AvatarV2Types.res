type avatarV2Status =
  | @as("none") None
  | @as("online") Online
  | @as("offline") Offline
  | @as("away") Away
  | @as("busy") Busy
type avatarV2StatusPosition =
  | @as("topRight") TopRight
  | @as("bottomRight") BottomRight
  | @as("topLeft") TopLeft
  | @as("bottomLeft") BottomLeft
type imageConfig = {
  border: string,
}
type fallbackTextConfig = {
  border: string,
  fontSize: AvatarTypes.fontSizeConfig3,
  fontWeight: AvatarTypes.fontSizeConfig3,
  lineHeight: AvatarTypes.fontSizeConfig3,
  color: string,
}
type backgroundColorConfig18 = {
  none: string,
  online: string,
  offline: string,
  away: string,
  busy: string,
}
type circularConfig2 = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type positionConfig2 = {
  circular: circularConfig2,
  rounded: circularConfig2,
}
type statusConfig = {
  width: AvatarTypes.fontSizeConfig3,
  height: AvatarTypes.fontSizeConfig3,
  border: AvatarTypes.fontSizeConfig3,
  borderRadius: string,
  backgroundColor: backgroundColorConfig18,
  boxShadow: string,
  position: positionConfig2,
}
type containerConfig10 = {
  backgroundColor: string,
  width: AvatarTypes.fontSizeConfig3,
  height: AvatarTypes.fontSizeConfig3,
  borderRadius: AvatarTypes.borderRadiusConfig4,
  image: imageConfig,
  fallbackText: fallbackTextConfig,
  status: statusConfig,
}
type slotConfig10 = {
  height: string,
  width: string,
}
type avatarV2TokensType = {
  gap: string,
  container: containerConfig10,
  slot: slotConfig10,
}
type responsiveAvatarV2Tokens = {
  sm: avatarV2TokensType,
  lg: avatarV2TokensType,
}
type avatarV2StatusConfig = {
  @as("type") type_: avatarV2Status,
  position?: avatarV2StatusPosition,
}
type avatarV2SkeletonConfig = {
  show: bool,
  variant?: TimelineTypes.variant2,
}
type avatarPropsConfig = {
  ...JsxDOM.domProps,
  status?: avatarV2StatusConfig,
  backgroundColor?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  skeleton?: avatarV2SkeletonConfig,
  onImageError?: string => unit,
  onImageLoad?: unit => unit,
}
