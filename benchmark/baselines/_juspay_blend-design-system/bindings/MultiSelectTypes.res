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
type multiSelectTooltipPropsConfig = {
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
  tooltipProps?: multiSelectTooltipPropsConfig,
  disableTruncation?: bool,
}
type multiSelectMenuGroupType = {
  groupLabel?: string,
  items: array<multiSelectMenuItemType>,
  showSeparator?: bool,
}
type multiSelectPrimaryActionConfig = {
  text: string,
  onClick: array<string> => unit,
  disabled?: bool,
  loading?: bool,
}
type multiSelectSecondaryActionConfig = {
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
type multiSelectColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type multiSelectLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: multiSelectColorConfig,
}
type multiSelectErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type multiSelectRequiredConfig = {
  color: string,
}
type multiSelectSmConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type multiSelectHeightConfig = {
  sm: multiSelectSmConfig,
  md: multiSelectSmConfig,
  lg: multiSelectSmConfig,
}
type multiSelectContainerConfig = {
  x: string,
  y: string,
}
type multiSelectSmConfig2 = {
  container: multiSelectContainerConfig,
  @as("no-container") noContainer: multiSelectContainerConfig,
}
type multiSelectPaddingConfig = {
  sm: multiSelectSmConfig2,
  md: multiSelectSmConfig2,
  lg: multiSelectSmConfig2,
}
type multiSelectContainerConfig2 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type multiSelectBackgroundColorConfig = {
  container: multiSelectContainerConfig2,
  @as("no-container") noContainer: multiSelectContainerConfig2,
}
type multiSelectCountConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
}
type multiSelectContainerConfig3 = {
  count: multiSelectCountConfig,
  text: multiSelectCountConfig,
}
type multiSelectSelectionTagConfig = {
  container: multiSelectContainerConfig3,
  @as("no-container") noContainer: multiSelectContainerConfig3,
}
type multiSelectPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type multiSelectTriggerConfig = {
  height: multiSelectHeightConfig,
  padding: multiSelectPaddingConfig,
  borderRadius: multiSelectHeightConfig,
  boxShadow: multiSelectSmConfig,
  backgroundColor: multiSelectBackgroundColorConfig,
  outline: multiSelectBackgroundColorConfig,
  selectionTag: multiSelectSelectionTagConfig,
  placeholder: multiSelectPlaceholderConfig,
  selectedValue: multiSelectPlaceholderConfig,
}
type multiSelectSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type multiSelectItemConfig = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: multiSelectColorConfig,
  optionsLabel: multiSelectLabelConfig,
  option: multiSelectLabelConfig,
  description: multiSelectLabelConfig,
  seperator: multiSelectSeperatorConfig,
}
type multiSelectMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: multiSelectPaddingConfig,
  item: multiSelectItemConfig,
}
type multiSelectHeaderConfig = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type multiSelectSearchConfig = {
  paddingX: string,
  marginTop: string,
  marginBottom: string,
}
type multiSelectContentConfig = {
  gap: string,
}
type multiSelectDrawerConfig = {
  header: multiSelectHeaderConfig,
  search: multiSelectSearchConfig,
  content: multiSelectContentConfig,
}
type multiSelectTokensType = {
  gap: string,
  label: multiSelectLabelConfig,
  subLabel: multiSelectLabelConfig,
  hintText: multiSelectLabelConfig,
  errorMessage: multiSelectErrorMessageConfig,
  required: multiSelectRequiredConfig,
  trigger: multiSelectTriggerConfig,
  menu: multiSelectMenuConfig,
  drawer: multiSelectDrawerConfig,
}
type responsiveMultiSelectTokens = {
  sm: multiSelectTokensType,
  lg: multiSelectTokensType,
}
