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
type avatarV2AvatarV2TokensTypeContainerWidthConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarV2AvatarV2TokensTypeContainerBorderRadiusConfig = {
  circular: string,
  rounded: string,
}
type avatarV2AvatarV2TokensTypeContainerImageConfig = {
  border: string,
}
type avatarV2AvatarV2TokensTypeContainerFallbackTextConfig = {
  border: string,
  fontSize: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  fontWeight: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  lineHeight: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  color: string,
}
type avatarV2AvatarV2TokensTypeContainerStatusBackgroundColorConfig = {
  none: string,
  online: string,
  offline: string,
  away: string,
  busy: string,
}
type avatarV2AvatarV2TokensTypeContainerStatusPositionCircularConfig = {
  sm: string,
  regular: string,
  md: string,
  lg: string,
  xl: string,
}
type avatarV2AvatarV2TokensTypeContainerStatusPositionConfig = {
  circular: avatarV2AvatarV2TokensTypeContainerStatusPositionCircularConfig,
  rounded: avatarV2AvatarV2TokensTypeContainerStatusPositionCircularConfig,
}
type avatarV2AvatarV2TokensTypeContainerStatusConfig = {
  width: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  height: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  border: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  borderRadius: string,
  backgroundColor: avatarV2AvatarV2TokensTypeContainerStatusBackgroundColorConfig,
  boxShadow: string,
  position: avatarV2AvatarV2TokensTypeContainerStatusPositionConfig,
}
type avatarV2AvatarV2TokensTypeContainerConfig = {
  backgroundColor: string,
  width: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  height: avatarV2AvatarV2TokensTypeContainerWidthConfig,
  borderRadius: avatarV2AvatarV2TokensTypeContainerBorderRadiusConfig,
  image: avatarV2AvatarV2TokensTypeContainerImageConfig,
  fallbackText: avatarV2AvatarV2TokensTypeContainerFallbackTextConfig,
  status: avatarV2AvatarV2TokensTypeContainerStatusConfig,
}
type avatarV2AvatarV2TokensTypeSlotConfig = {
  height: string,
  width: string,
}
type avatarV2TokensType = {
  gap: string,
  container: avatarV2AvatarV2TokensTypeContainerConfig,
  slot: avatarV2AvatarV2TokensTypeSlotConfig,
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
  variant?: TimelineTypes.variant3,
}
type avatarV2AvatarPropsConfig = {
  disabled?: bool,
  width?: string,
  size?: avatarV2Size,
  height?: string,
  status?: avatarV2StatusConfig,
  backgroundColor?: string,
  shape?: avatarV2Shape,
  leftSlot?: React.element,
  rightSlot?: React.element,
  alt?: string,
  skeleton?: avatarV2SkeletonConfig,
  onImageError?: JsError.t => unit,
  onImageLoad?: unit => unit,
}
