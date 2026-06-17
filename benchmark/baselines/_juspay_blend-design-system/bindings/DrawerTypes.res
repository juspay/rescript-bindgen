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
type drawerMobileOffsetConfig = {
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
type drawerItemsConfig2 = {
  ...JsxDOM.domProps,
}
type drawerItemsConfig = {
  groupLabel?: string,
  items: drawerItemsConfig2,
  showSeparator?: bool,
}
type drawerBorderRadiusConfig = {
  topLeft?: string,
  topRight?: string,
  bottomLeft?: string,
  bottomRight?: string,
}
type drawerOverlayConfig = {
  backgroundColor?: string,
}
type drawerPaddingConfig = {
  x?: string,
  y?: string,
}
type drawerHandleConfig = {
  backgroundColor?: string,
  borderRadius?: string,
  width?: string,
  height?: string,
}
type drawerContentConfig = {
  backgroundColor?: string,
  padding: drawerPaddingConfig,
  handle: drawerHandleConfig,
}
type drawerTokensType = {
  borderRadius: drawerBorderRadiusConfig,
  overlay: drawerOverlayConfig,
  offset: drawerMobileOffsetConfig,
  content: drawerContentConfig,
}
type responsiveDrawerTokens = {
  sm: drawerTokensType,
  lg: drawerTokensType,
}
