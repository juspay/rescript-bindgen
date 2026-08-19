type avatarV2Size =
  | @as("sm") Sm
  | @as("regular") Regular
  | @as("md") Md
  | @as("lg") Lg
  | @as("xl") Xl
type avatarV2Shape =
  | @as("circular") Circular
  | @as("rounded") Rounded
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
type avatarV2AvatarV2SkeletonConfigVariant =
  | @as("pulse") Pulse
  | @as("wave") Wave
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
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; regular: FontSize<number | (string & {})>; md: FontSize<number | (stri`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; regular: FontWeight; md: FontWeight; lg: FontWeight; xl: FontWeight; }`
  lineHeight: string,  // ⚪ loose — was `{ sm: LineHeight<number | (string & {})>; regular: LineHeight<number | (string & {})>; md: LineHeight<number |`
  color: string,
}
type avatarV2AvatarV2TokensTypeContainerStatusConfig = {
  width: string,  // ⚪ loose — was `{ sm: Width<number | (string & {})>; regular: Width<number | (string & {})>; md: Width<number | (string & {})>`
  height: string,  // ⚪ loose — was `{ sm: Height<number | (string & {})>; regular: Height<number | (string & {})>; md: Height<number | (string & {`
  border: string,  // ⚪ loose — was `{ sm: Border<number | (string & {})>; regular: Border<number | (string & {})>; md: Border<number | (string & {`
  borderRadius: string,
  backgroundColor: string,  // ⚪ loose — was `{ none: BackgroundColor; online: BackgroundColor; offline: BackgroundColor; away: BackgroundColor; busy: Backg`
  boxShadow: string,
  position: string,  // ⚪ loose — was `{ circular: { sm: { top?: Top<number | (string & {})>; right?: Right<number | (string & {})>; bottom?: Bottom<`
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
  variant?: avatarV2AvatarV2SkeletonConfigVariant,
}
type avatarV2Dimensions = {
  width?: string,
  height?: string,
}
type avatarV2GetStatusPositionStylesConfig = {
  top?: string,
  right?: string,
  bottom?: string,
  left?: string,
}
type avatarV2DEFAULTPOSITIONConfig = {
  top: string,
  right: string,
  bottom: string,
}
type avatarV2AvatarPropsConfig = {
  width?: string,
  size?: avatarV2Size,
  height?: string,
  alt?: string,
  disabled?: bool,
  backgroundColor?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  status?: avatarV2StatusConfig,
  shape?: avatarV2Shape,
  skeleton?: avatarV2SkeletonConfig,
  onImageError?: JsError.t => unit,
  onImageLoad?: unit => unit,
}
