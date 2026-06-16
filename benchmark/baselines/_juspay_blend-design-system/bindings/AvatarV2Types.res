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
type widthConfig4 = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type borderRadiusConfig14 = {
  circular: string,
  rounded: string,
}
type imageConfig = {
  border: string,
}
type fallbackTextConfig = {
  border: string,
  fontSize: widthConfig4,
  fontWeight: widthConfig4,
  lineHeight: widthConfig4,
  color: string,
}
type backgroundColorConfig24 = {
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
  width: widthConfig4,
  height: widthConfig4,
  border: widthConfig4,
  borderRadius: string,
  backgroundColor: backgroundColorConfig24,
  boxShadow: string,
  position: positionConfig2,
}
type containerConfig15 = {
  backgroundColor: string,
  width: widthConfig4,
  height: widthConfig4,
  borderRadius: borderRadiusConfig14,
  image: imageConfig,
  fallbackText: fallbackTextConfig,
  status: statusConfig,
}
type slotConfig12 = {
  height: string,
  width: string,
}
type avatarV2TokensType = {
  gap: string,
  container: containerConfig15,
  slot: slotConfig12,
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
