type drawerDirection =
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("top") Top
type overflowY =
  | @as("hidden") Hidden
  | @as("auto") Auto
  | @as("scroll") Scroll
  | @as("visible") Visible
type mobileOffsetConfig = {
  top?: string,
  bottom?: string,
  left?: string,
  right?: string,
}
type selectDrawerItem = {
  value: string,
  label: string,
  subLabel?: string,
  slot1?: React.element,
  disabled?: bool,
}
type selectDrawerGroup = {
  groupLabel?: string,
  items: array<selectDrawerItem>,
  showSeparator?: bool,
}
type itemsConfig2 = {
  groupLabel?: string,
  items: DateRangePickerTypes.presetsConfig,
  showSeparator?: bool,
}
type overlayConfig = {
  backgroundColor: string,
}
type offsetConfig = {
  top: string,
  bottom: string,
  left: string,
  right: string,
}
type handleConfig = {
  backgroundColor: string,
  borderRadius: string,
  width: string,
  height: string,
}
type contentConfig8 = {
  backgroundColor: string,
  padding: ModalTypes.paddingConfig5,
  handle: handleConfig,
}
type drawerTokensType = {
  borderRadius: DateRangePickerTypes.borderRadiusConfig6,
  overlay: overlayConfig,
  offset: offsetConfig,
  content: contentConfig8,
}
type responsiveDrawerTokens = {
  sm: drawerTokensType,
  lg: drawerTokensType,
}
