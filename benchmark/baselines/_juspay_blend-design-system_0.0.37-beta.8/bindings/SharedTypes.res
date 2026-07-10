type tenantBadge = {
  text: string,
  size?: BadgeTypes.badgeSize,
  color?: BadgeTypes.badgeColor,
  position?: BadgeTypes.badgePosition,
}
type leftPanelItem = {
  label: string,
  icon: React.element,
  value?: string,
  showInPanel?: bool,
  badge?: tenantBadge,
}
type leftPanelInfo = {
  items: array<leftPanelItem>,
  selected: string,
  onSelect: string => unit,
  tenantSlot1?: React.element,
  tenantSlot2?: React.element,
  tenantFooter?: React.element,
}
type sharedMerchantInfoItemsConfig = {
  label: string,
  value: string,
  icon?: React.element,
}
type merchantInfo = {
  items: array<sharedMerchantInfoItemsConfig>,
  selected: string,
  onSelect: string => unit,
}
