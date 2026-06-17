type avatarV2Size =
  | @as("sm") Sm
  | @as("regular") Regular
  | @as("md") Md
  | @as("lg") Lg
  | @as("xl") Xl
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
type avatarV2Shape =
  | @as("circular") Circular
  | @as("rounded") Rounded
type avatarV2WidthConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarV2BorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarV2ImageConfig = {
  border: string,
}
type avatarV2FallbackTextConfig = {
  border: string,
  fontSize: avatarV2WidthConfig,
  fontWeight: avatarV2WidthConfig,
  lineHeight: avatarV2WidthConfig,
  color: string,
}
type avatarV2BackgroundColorConfig = {
  none: string,
  online: string,
  offline: string,
  away: string,
  busy: string,
}
type avatarV2CircularConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarV2PositionConfig = {
  circular: avatarV2CircularConfig,
  rounded: avatarV2CircularConfig,
}
type avatarV2StatusConfig = {
  width: avatarV2WidthConfig,
  height: avatarV2WidthConfig,
  border: avatarV2WidthConfig,
  borderRadius: string,
  backgroundColor: avatarV2BackgroundColorConfig,
  boxShadow: string,
  position: avatarV2PositionConfig,
}
type avatarV2ContainerConfig = {
  backgroundColor: string,
  width: avatarV2WidthConfig,
  height: avatarV2WidthConfig,
  borderRadius: avatarV2BorderRadiusConfig,
  image: avatarV2ImageConfig,
  fallbackText: avatarV2FallbackTextConfig,
  status: avatarV2StatusConfig,
}
type avatarV2SlotConfig = {
  height: string,
  width: string,
}
type avatarV2TokensType = {
  gap: string,
  container: avatarV2ContainerConfig,
  slot: avatarV2SlotConfig,
}
type responsiveAvatarV2Tokens = {
  sm: avatarV2TokensType,
  lg: avatarV2TokensType,
}
type avatarV2StatusConfig2 = {
  @as("type") type_: avatarV2Status,
  position?: avatarV2StatusPosition,
}
type avatarV2SkeletonConfig = {
  show: bool,
  variant?: TimelineTypes.variant2,
}
type avatarV2AvatarPropsConfig = {
  disabled?: bool,
  width?: string,
  size?: avatarV2Size,
  height?: string,
  status?: avatarV2StatusConfig2,
  backgroundColor?: string,
  shape?: avatarV2Shape,
  leftSlot?: React.element,
  rightSlot?: React.element,
  alt?: string,
  skeleton?: avatarV2SkeletonConfig,
  onImageError?: JsError.t => unit,
  onImageLoad?: unit => unit,
}
