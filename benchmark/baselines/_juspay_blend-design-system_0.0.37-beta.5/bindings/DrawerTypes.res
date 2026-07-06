type drawerDirection =
  | @as("top") Top
  | @as("left") Left
  | @as("bottom") Bottom
  | @as("right") Right
type drawerOverflowY =
  | @as("auto") Auto
  | @as("hidden") Hidden
  | @as("scroll") Scroll
  | @as("visible") Visible
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
