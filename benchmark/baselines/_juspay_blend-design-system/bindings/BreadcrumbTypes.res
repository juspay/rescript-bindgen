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
type colorConfig3 = {
  default: string,
  hover: string,
  active: string,
}
type textConfig5 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig3,
}
type itemConfig = {
  padding: string,
  gap: string,
  text: textConfig5,
}
type breadcrumbTokenType = {
  gap: string,
  item: itemConfig,
}
type responsiveBreadcrumbTokens = {
  sm: breadcrumbTokenType,
  lg: breadcrumbTokenType,
}
