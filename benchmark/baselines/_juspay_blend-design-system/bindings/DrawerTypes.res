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
type itemsConfig3 = {
  ...JsxDOM.domProps,
}
type itemsConfig2 = {
  groupLabel?: string,
  items: itemsConfig3,
  showSeparator?: bool,
}
type borderRadiusConfig11 = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
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
type paddingConfig22 = {
  x: string,
  y: string,
}
type handleConfig = {
  backgroundColor: string,
  borderRadius: string,
  width: string,
  height: string,
}
type contentConfig9 = {
  backgroundColor: string,
  padding: paddingConfig22,
  handle: handleConfig,
}
type drawerTokensType = {
  borderRadius: borderRadiusConfig11,
  overlay: overlayConfig,
  offset: offsetConfig,
  content: contentConfig9,
}
type responsiveDrawerTokens = {
  sm: drawerTokensType,
  lg: drawerTokensType,
}
