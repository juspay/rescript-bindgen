type breadcrumbBreadcrumbTokenTypeItemTextColorConfig = {
  active: string,
  default: string,
  hover: string,
}
type breadcrumbBreadcrumbTokenTypeItemTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: breadcrumbBreadcrumbTokenTypeItemTextColorConfig,
}
type breadcrumbBreadcrumbTokenTypeItemConfig = {
  padding: string,
  gap: string,
  text: breadcrumbBreadcrumbTokenTypeItemTextConfig,
}
type breadcrumbTokenType = {
  gap: string,
  item: breadcrumbBreadcrumbTokenTypeItemConfig,
}
type responsiveBreadcrumbTokens = {
  sm: breadcrumbTokenType,
  lg: breadcrumbTokenType,
}
type breadcrumbSkeletonProps = {
  show: bool,
  variant: SkeletonTypes.skeletonVariant,
}
type breadcrumbItemType = {
  leftSlot?: React.element,
  rightSlot?: React.element,
  label: string,
  href: string,
  onClick?: ReactEvent.Mouse.t => unit,
  skeleton?: breadcrumbSkeletonProps,
}
