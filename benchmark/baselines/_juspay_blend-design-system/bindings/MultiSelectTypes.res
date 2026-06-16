type multiSelectVariant =
  | @as("container") Container
  | @as("no-container") NoContainer
type multiSelectSelectionTagType =
  | @as("count") Count
  | @as("text") Text
type multiSelectMenuSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type multiSelectMenuAlignment =
  | @as("start") Start
  | @as("center") Center
  | @as("end") End
type multiSelectMenuSide =
  | @as("top") Top
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
type tooltipPropsConfig4 = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec multiSelectMenuItemType = {
  label: string,
  value: string,
  checked?: bool,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  disabled?: bool,
  alwaysSelected?: bool,
  onClick?: unit => unit,
  subMenu?: array<multiSelectMenuItemType>,
  tooltip?: React.element,
  tooltipProps?: tooltipPropsConfig4,
  disableTruncation?: bool,
}
type multiSelectMenuGroupType = {
  groupLabel?: string,
  items: array<multiSelectMenuItemType>,
  showSeparator?: bool,
}
type primaryActionConfig2 = {
  text: string,
  onClick: array<string> => unit,
  disabled?: bool,
  loading?: bool,
}
type secondaryActionConfig = {
  text: string,
  onClick: unit => unit,
  disabled?: bool,
  loading?: bool,
}
type multiSelectSkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type colorConfig12 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type labelConfig4 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig12,
}
type errorMessageConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type requiredConfig2 = {
  color: string,
}
type smConfig9 = {
  container: string,
  @as("no-container") noContainer: string,
}
type heightConfig = {
  sm: smConfig9,
  md: smConfig9,
  lg: smConfig9,
}
type containerConfig4 = {
  x: string,
  y: string,
}
type smConfig10 = {
  container: containerConfig4,
  @as("no-container") noContainer: containerConfig4,
}
type paddingConfig20 = {
  sm: smConfig10,
  md: smConfig10,
  lg: smConfig10,
}
type containerConfig5 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  closed: string,
  error: string,
}
type backgroundColorConfig8 = {
  container: containerConfig5,
  @as("no-container") noContainer: containerConfig5,
}
type countConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
}
type containerConfig6 = {
  count: countConfig,
  text: countConfig,
}
type selectionTagConfig = {
  container: containerConfig6,
  @as("no-container") noContainer: containerConfig6,
}
type placeholderConfig2 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type triggerConfig5 = {
  height: heightConfig,
  padding: paddingConfig20,
  borderRadius: heightConfig,
  boxShadow: smConfig9,
  backgroundColor: backgroundColorConfig8,
  outline: backgroundColorConfig8,
  selectionTag: selectionTagConfig,
  placeholder: placeholderConfig2,
  selectedValue: placeholderConfig2,
}
type seperatorConfig2 = {
  color: string,
  height: string,
  margin: string,
}
type itemConfig6 = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: colorConfig12,
  optionsLabel: labelConfig4,
  option: labelConfig4,
  description: labelConfig4,
  seperator: seperatorConfig2,
}
type menuConfig2 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: paddingConfig20,
  item: itemConfig6,
}
type headerConfig11 = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type searchConfig2 = {
  paddingX: string,
  marginTop: string,
  marginBottom: string,
}
type contentConfig4 = {
  gap: string,
}
type drawerConfig = {
  header: headerConfig11,
  search: searchConfig2,
  content: contentConfig4,
}
type multiSelectTokensType = {
  gap: string,
  label: labelConfig4,
  subLabel: labelConfig4,
  hintText: labelConfig4,
  errorMessage: errorMessageConfig2,
  required: requiredConfig2,
  trigger: triggerConfig5,
  menu: menuConfig2,
  drawer: drawerConfig,
}
type responsiveMultiSelectTokens = {
  sm: multiSelectTokensType,
  lg: multiSelectTokensType,
}
