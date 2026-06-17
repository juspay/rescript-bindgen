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
type menuTooltipPropsConfig = {
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
  tooltipProps?: menuTooltipPropsConfig,
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
type menuPaddingConfig = {
  x: string,
  y: string,
}
type menuEnabledConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
}
type menuDefaultConfig = {
  enabled: menuEnabledConfig,
  disabled: menuEnabledConfig,
}
type menuPrimaryConfig = {
  enabled: string,
  disabled: string,
}
type menuActionConfig = {
  primary: menuPrimaryConfig,
  danger: menuPrimaryConfig,
}
type menuBackgroundColorConfig = {
  default: menuDefaultConfig,
  action: menuActionConfig,
}
type menuOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: menuPaddingConfig,
  margin: menuPaddingConfig,
}
type menuActionConfig2 = {
  primary: menuPrimaryConfig,
  danger: menuPrimaryConfig,
}
type menuColorConfig = {
  default: menuPrimaryConfig,
  action: menuActionConfig2,
}
type menuOptionConfig = {
  fontSize: string,
  fontWeight: string,
  color: menuColorConfig,
}
type menuSeperatorConfig = {
  color: string,
  height: string,
  margin: menuPaddingConfig,
}
type menuItemConfig = {
  padding: menuPaddingConfig,
  margin: menuPaddingConfig,
  borderRadius: string,
  backgroundColor: menuBackgroundColorConfig,
  gap: string,
  optionsLabel: menuOptionsLabelConfig,
  option: menuOptionConfig,
  description: menuOptionConfig,
  seperator: menuSeperatorConfig,
}
type menuTokensType = {
  boxShadow: string,
  backgroundColor: string,
  padding: menuPaddingConfig,
  border: string,
  borderRadius: string,
  item: menuItemConfig,
}
type responsiveMenuTokensType = {
  sm: menuTokensType,
  lg: menuTokensType,
}
@unboxed type menuItemTypeVirtualItemHeight = Num(float) | Fn((menuItemType, float) => float)
module CollisonBoundaryRef = {
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
  collisonBoundaryRef?: CollisonBoundaryRef.t,
  skeleton?: menuSkeletonProps,
}
