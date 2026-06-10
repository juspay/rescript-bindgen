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
  tooltipProps?: MultiSelectSingleSelectTypes.tooltipPropsConfig,
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
type enabledConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
}
type defaultConfig6 = {
  enabled: enabledConfig,
  disabled: enabledConfig,
}
type primaryConfig6 = {
  enabled: string,
  disabled: string,
}
type actionConfig = {
  primary: primaryConfig6,
  danger: primaryConfig6,
}
type backgroundColorConfig6 = {
  default: defaultConfig6,
  action: actionConfig,
}
type optionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: ModalTypes.paddingConfig5,
  margin: ModalTypes.paddingConfig5,
}
type actionConfig2 = {
  primary: string,
  danger: string,
}
type colorConfig11 = {
  default: primaryConfig6,
  action: actionConfig2,
}
type optionConfig = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig11,
}
type seperatorConfig = {
  color: string,
  height: string,
  margin: ModalTypes.paddingConfig5,
}
type itemConfig3 = {
  padding: ModalTypes.paddingConfig5,
  margin: ModalTypes.paddingConfig5,
  borderRadius: string,
  backgroundColor: backgroundColorConfig6,
  gap: string,
  optionsLabel: optionsLabelConfig,
  option: optionConfig,
  description: optionConfig,
  seperator: seperatorConfig,
}
type menuTokensType = {
  boxShadow: string,
  backgroundColor: string,
  padding: ModalTypes.paddingConfig5,
  border: string,
  borderRadius: string,
  item: itemConfig3,
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
type overflowMenuPropsConfig = {
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
  skeleton?: MultiSelectSingleSelectTypes.singleSelectSkeletonProps,
}
