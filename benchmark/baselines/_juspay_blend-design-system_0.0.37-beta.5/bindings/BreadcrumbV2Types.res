type breadcrumbV2BreadcrumbV2TokensTypeItemTextColorConfig = {
  active: string,
  default: string,
  hover: string,
}
type breadcrumbV2BreadcrumbV2TokensTypeItemTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: breadcrumbV2BreadcrumbV2TokensTypeItemTextColorConfig,
}
type breadcrumbV2BreadcrumbV2TokensTypeItemConfig = {
  padding: string,
  gap: string,
  text: breadcrumbV2BreadcrumbV2TokensTypeItemTextConfig,
}
type breadcrumbV2BreadcrumbV2TokensTypeEllipsisConfig = {
  color: string,
  borderRadius: string,
  size: float,
}
type breadcrumbV2BreadcrumbV2TokensTypeSeparatorConfig = {
  color: string,
}
type breadcrumbV2TokensType = {
  gap: string,
  item: breadcrumbV2BreadcrumbV2TokensTypeItemConfig,
  ellipsis: breadcrumbV2BreadcrumbV2TokensTypeEllipsisConfig,
  separator: breadcrumbV2BreadcrumbV2TokensTypeSeparatorConfig,
}
type responsiveBreadcrumbV2Tokens = {
  sm: breadcrumbV2TokensType,
  lg: breadcrumbV2TokensType,
}
type breadcrumbV2ItemType = {
  id?: HighchartsSharedTypes.stringOrNumber,
  leftSlot?: React.element,
  rightSlot?: React.element,
  label: string,
  href: string,
  onClick?: ReactEvent.Mouse.t => unit,
}
type indexedBreadcrumbChild = {
  el: React.element,
  idx: float,
}
type breadcrumbCompoundItemProps = {
  href?: string,
  onClick?: ReactEvent.Mouse.t => unit,
  isActive?: bool,
  children: React.element,
}
type breadcrumbV2ComputeBreadcrumbOverflowLayoutConfig = {
  shouldShowMenu: bool,
  base?: indexedBreadcrumbChild,
  rest: array<indexedBreadcrumbChild>,
  menuItems: array<indexedBreadcrumbChild>,
}
