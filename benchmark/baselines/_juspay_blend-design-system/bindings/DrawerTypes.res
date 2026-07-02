type drawerDirection =
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("top") Top
type drawerOverflowY =
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
type drawerItemsItemsConfig = {
  value: string,
  label: string,
  subLabel?: string,
  slot1?: React.element,
  disabled?: bool,
  nestedItems?: array<selectDrawerGroup>,
}
type drawerItemsConfig = {
  groupLabel?: string,
  items: array<drawerItemsItemsConfig>,
  showSeparator?: bool,
}
type drawerDrawerTokensTypeBorderRadiusConfig = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
}
type drawerDrawerTokensTypeOverlayConfig = {
  backgroundColor: string,
}
type drawerDrawerTokensTypeOffsetConfig = {
  top: string,
  bottom: string,
  left: string,
  right: string,
}
type drawerDrawerTokensTypeContentPaddingConfig = {
  x: string,
  y: string,
}
type drawerDrawerTokensTypeContentHandleConfig = {
  backgroundColor: string,
  borderRadius: string,
  width: string,
  height: string,
}
type drawerDrawerTokensTypeContentConfig = {
  backgroundColor: string,
  padding: drawerDrawerTokensTypeContentPaddingConfig,
  handle: drawerDrawerTokensTypeContentHandleConfig,
}
type drawerTokensType = {
  borderRadius: drawerDrawerTokensTypeBorderRadiusConfig,
  overlay: drawerDrawerTokensTypeOverlayConfig,
  offset: drawerDrawerTokensTypeOffsetConfig,
  content: drawerDrawerTokensTypeContentConfig,
}
type responsiveDrawerTokens = {
  sm: drawerTokensType,
  lg: drawerTokensType,
}
