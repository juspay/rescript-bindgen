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
type breadcrumbColorConfig = {
  default: string,
  hover: string,
  active: string,
}
type breadcrumbTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: breadcrumbColorConfig,
}
type breadcrumbItemConfig = {
  padding: string,
  gap: string,
  text: breadcrumbTextConfig,
}
type breadcrumbTokenType = {
  gap: string,
  item: breadcrumbItemConfig,
}
type responsiveBreadcrumbTokens = {
  sm: breadcrumbTokenType,
  lg: breadcrumbTokenType,
}
