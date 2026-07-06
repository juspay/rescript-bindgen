type menuV2ItemVariant =
  | @as("default") Default
  | @as("action") Action
type menuV2ItemActionType =
  | @as("primary") Primary
  | @as("danger") Danger
type menuV2Alignment =
  | @as("start") Start
  | @as("center") Center
  | @as("end") End
type menuV2Side =
  | @as("top") Top
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
type menuV2MenuV2TokensTypeSearchIconConfig = {
  width: string,
}
type menuV2MenuV2TokensTypeGroupLabelConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
}
type stateToken = {
  active: string,
  default: string,
  hover: string,
  disabled: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type menuV2MenuV2VariantTokenActionConfig = {
  primary: stateToken,
  danger: stateToken,
}
type menuV2VariantToken = {
  default: stateToken,
  action: menuV2MenuV2VariantTokenActionConfig,
}
type menuV2VariantToken2 = {
  default: stateToken,
  action: menuV2MenuV2VariantTokenActionConfig,
}
type menuV2MenuV2TokensTypeGroupItemTextSubTextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: menuV2VariantToken2,
}
type menuV2MenuV2TokensTypeGroupItemTextLeftSlotConfig = {
  maxWidth: string,
  maxHeight: string,
}
type menuV2MenuV2TokensTypeGroupItemTextRightChevronConfig = {
  color: string,
  width: string,
}
type menuV2MenuV2TokensTypeGroupItemTextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: menuV2VariantToken2,
  subText: menuV2MenuV2TokensTypeGroupItemTextSubTextConfig,
  leftSlot: menuV2MenuV2TokensTypeGroupItemTextLeftSlotConfig,
  rightChevron: menuV2MenuV2TokensTypeGroupItemTextRightChevronConfig,
}
type menuV2MenuV2TokensTypeGroupItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
  gap: string,
  borderRadius: string,
  backgroundColor: menuV2VariantToken,
  text: menuV2MenuV2TokensTypeGroupItemTextConfig,
}
type menuV2MenuV2TokensTypeGroupConfig = {
  label: menuV2MenuV2TokensTypeGroupLabelConfig,
  item: menuV2MenuV2TokensTypeGroupItemConfig,
}
type menuV2MenuV2TokensTypeSeparatorConfig = {
  color: string,
  height: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
}
type menuV2TokensType = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  zIndex: string,
  minWidth: string,
  maxWidth: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  searchIcon: menuV2MenuV2TokensTypeSearchIconConfig,
  group: menuV2MenuV2TokensTypeGroupConfig,
  separator: menuV2MenuV2TokensTypeSeparatorConfig,
}
type responsiveMenuV2TokensType = {
  sm: menuV2TokensType,
  lg: menuV2TokensType,
}
type menuV2ItemLabel = {
  text: string,
  leftSlot?: React.element,
}
type menuV2ItemTooltipProps = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec menuV2ItemType = {
  id?: string,
  label: menuV2ItemLabel,
  subLabel?: string,
  variant?: menuV2ItemVariant,
  actionType?: menuV2ItemActionType,
  disabled?: bool,
  onClick?: unit => unit,
  subMenu?: array<menuV2ItemType>,
  enableSubMenuSearch?: bool,
  subMenuSearchPlaceholder?: string,
  tooltip?: React.element,
  tooltipProps?: menuV2ItemTooltipProps,
}
type menuV2GroupType = {
  id?: string,
  label?: string,
  items: array<menuV2ItemType>,
  showSeparator?: bool,
}
type menuV2Dimensions = {
  minWidth?: string,
  maxWidth?: string,
  minHeight?: string,
  maxHeight?: string,
}
type menuV2VirtualScrollingConfig = {
  itemHeight?: float,
  overscan?: float,
  threshold?: float,
}
type menuV2FlattenMenuV2GroupsLabelConfig = {
  @as("type") type_: string,  // ⚪ loose — was `"label"`
  id: string,
  label: string,
}
type menuV2FlattenMenuV2GroupsSeparatorConfig = {
  @as("type") type_: string,  // ⚪ loose — was `"separator"`
  id: string,
}
type menuV2FlattenMenuV2GroupsItemConfig = {
  @as("type") type_: string,  // ⚪ loose — was `"item"`
  id: string,
  item: menuV2ItemType,
  groupId: float,
  itemIndex: float,
}
module MenuV2CollisionBoundaryRef = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external fromHTMLElements: array<Dom.element> => t = "%identity"
}
module MenuV2FlatRow = {
  type t
  external fromMenuV2FlattenMenuV2GroupsLabelConfig: menuV2FlattenMenuV2GroupsLabelConfig => t = "%identity"
  external fromMenuV2FlattenMenuV2GroupsSeparatorConfig: menuV2FlattenMenuV2GroupsSeparatorConfig => t = "%identity"
  external fromMenuV2FlattenMenuV2GroupsItemConfig: menuV2FlattenMenuV2GroupsItemConfig => t = "%identity"
}
