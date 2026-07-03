type menuItemVariant =
  | @as("default") Default
  | @as("action") Action
type menuItemActionType =
  | @as("primary") Primary
  | @as("danger") Danger
type menuAlignment =
  | @as("start") Start
  | @as("center") Center
  | @as("end") End
type menuSide =
  | @as("top") Top
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
type menuMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec menuItemType = {
  label: string,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  variant?: menuItemVariant,
  actionType?: menuItemActionType,
  disabled?: bool,
  onClick?: unit => unit,
  subMenu?: array<menuItemType>,
  enableSubMenuSearch?: bool,
  subMenuSearchPlaceholder?: string,
  tooltip?: React.element,
  tooltipProps?: menuMenuItemTypeTooltipPropsConfig,
  enableSubMenuVirtualScrolling?: bool,
  subMenuVirtualItemHeight?: float,
  subMenuVirtualOverscan?: float,
  subMenuVirtualScrollThreshold?: float,
}
type menuGroupType = {
  label?: string,
  items: array<menuItemType>,
  showSeparator?: bool,
}
type menuSkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type menuMenuTokensTypePaddingConfig = {
  x: string,
  y: string,
}
type menuMenuTokensTypeItemBackgroundColorDefaultEnabledConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
}
type menuMenuTokensTypeItemBackgroundColorDefaultConfig = {
  enabled: menuMenuTokensTypeItemBackgroundColorDefaultEnabledConfig,
  disabled: menuMenuTokensTypeItemBackgroundColorDefaultEnabledConfig,
}
type menuMenuTokensTypeItemBackgroundColorActionPrimaryConfig = {
  enabled: menuMenuTokensTypeItemBackgroundColorDefaultEnabledConfig,
  disabled: menuMenuTokensTypeItemBackgroundColorDefaultEnabledConfig,
}
type menuMenuTokensTypeItemBackgroundColorActionConfig = {
  primary: menuMenuTokensTypeItemBackgroundColorActionPrimaryConfig,
  danger: menuMenuTokensTypeItemBackgroundColorActionPrimaryConfig,
}
type menuMenuTokensTypeItemBackgroundColorConfig = {
  default: menuMenuTokensTypeItemBackgroundColorDefaultConfig,
  action: menuMenuTokensTypeItemBackgroundColorActionConfig,
}
type menuMenuTokensTypeItemOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: menuMenuTokensTypePaddingConfig,
  margin: menuMenuTokensTypePaddingConfig,
}
type menuMenuTokensTypeItemOptionColorActionConfig = {
  primary: menuMenuTokensTypeItemBackgroundColorDefaultConfig,
  danger: menuMenuTokensTypeItemBackgroundColorDefaultConfig,
}
type menuMenuTokensTypeItemOptionColorConfig = {
  default: menuMenuTokensTypeItemBackgroundColorActionPrimaryConfig,
  action: menuMenuTokensTypeItemOptionColorActionConfig,
}
type menuMenuTokensTypeItemOptionConfig = {
  fontSize: string,
  fontWeight: string,
  color: menuMenuTokensTypeItemOptionColorConfig,
}
type menuMenuTokensTypeItemSeperatorConfig = {
  color: string,
  height: string,
  margin: menuMenuTokensTypePaddingConfig,
}
type menuMenuTokensTypeItemConfig = {
  padding: menuMenuTokensTypePaddingConfig,
  margin: menuMenuTokensTypePaddingConfig,
  borderRadius: string,
  backgroundColor: menuMenuTokensTypeItemBackgroundColorConfig,
  gap: string,
  optionsLabel: menuMenuTokensTypeItemOptionsLabelConfig,
  option: menuMenuTokensTypeItemOptionConfig,
  description: menuMenuTokensTypeItemOptionConfig,
  seperator: menuMenuTokensTypeItemSeperatorConfig,
}
type menuTokensType = {
  boxShadow: string,
  backgroundColor: string,
  padding: menuMenuTokensTypePaddingConfig,
  border: string,
  borderRadius: string,
  item: menuMenuTokensTypeItemConfig,
}
type responsiveMenuTokensType = {
  sm: menuTokensType,
  lg: menuTokensType,
}
@unboxed type menuItemTypeVirtualItemHeight = Num(float) | Fn((menuItemType, float) => float)
module MenuCollisonBoundaryRef = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
}
type menuOverflowMenuPropsConfig = {
  trigger?: React.element,
  items?: array<menuGroupType>,
  maxHeight?: float,
  minHeight?: float,
  maxWidth?: float,
  minWidth?: float,
  enableSearch?: bool,
  searchPlaceholder?: string,
  enableVirtualScrolling?: bool,
  virtualItemHeight?: menuItemTypeVirtualItemHeight,
  virtualOverscan?: float,
  virtualScrollThreshold?: float,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  asModal?: bool,
  alignment?: menuAlignment,
  side?: menuSide,
  sideOffset?: float,
  alignOffset?: float,
  collisonBoundaryRef?: MenuCollisonBoundaryRef.t,
  skeleton?: menuSkeletonProps,
}
