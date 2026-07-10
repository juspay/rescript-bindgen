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
type multiSelectMultiSelectMenuItemTypeTooltipPropsConfig = {
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
  tooltipProps?: multiSelectMultiSelectMenuItemTypeTooltipPropsConfig,
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
type multiSelectMultiSelectTokensTypeLabelColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  selected: string,
  focus: string,
  focusVisible: string,
}
type multiSelectMultiSelectTokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: multiSelectMultiSelectTokensTypeLabelColorConfig,
}
type multiSelectMultiSelectTokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type multiSelectMultiSelectTokensTypeRequiredConfig = {
  color: string,
}
type multiSelectMultiSelectTokensTypeTriggerHeightSmConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type multiSelectMultiSelectTokensTypeTriggerHeightConfig = {
  sm: multiSelectMultiSelectTokensTypeTriggerHeightSmConfig,
  md: multiSelectMultiSelectTokensTypeTriggerHeightSmConfig,
  lg: multiSelectMultiSelectTokensTypeTriggerHeightSmConfig,
}
type multiSelectMultiSelectTokensTypeTriggerPaddingSmContainerConfig = {
  x: string,
  y: string,
}
type multiSelectMultiSelectTokensTypeTriggerPaddingSmConfig = {
  container: multiSelectMultiSelectTokensTypeTriggerPaddingSmContainerConfig,
  @as("no-container") noContainer: multiSelectMultiSelectTokensTypeTriggerPaddingSmContainerConfig,
}
type multiSelectMultiSelectTokensTypeTriggerPaddingConfig = {
  sm: multiSelectMultiSelectTokensTypeTriggerPaddingSmConfig,
  md: multiSelectMultiSelectTokensTypeTriggerPaddingSmConfig,
  lg: multiSelectMultiSelectTokensTypeTriggerPaddingSmConfig,
}
type multiSelectMultiSelectTokensTypeTriggerBackgroundColorContainerConfig = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig = {
  container: multiSelectMultiSelectTokensTypeTriggerBackgroundColorContainerConfig,
  @as("no-container") noContainer: multiSelectMultiSelectTokensTypeTriggerBackgroundColorContainerConfig,
}
type multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerCountConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
}
type multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerConfig = {
  count: multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerCountConfig,
  text: multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerCountConfig,
}
type multiSelectMultiSelectTokensTypeTriggerSelectionTagConfig = {
  container: multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerConfig,
  @as("no-container") noContainer: multiSelectMultiSelectTokensTypeTriggerSelectionTagContainerConfig,
}
type multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type multiSelectMultiSelectTokensTypeTriggerConfig = {
  height: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
  padding: multiSelectMultiSelectTokensTypeTriggerPaddingConfig,
  borderRadius: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
  boxShadow: multiSelectMultiSelectTokensTypeTriggerHeightSmConfig,
  backgroundColor: multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig,
  outline: multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig,
  selectionTag: multiSelectMultiSelectTokensTypeTriggerSelectionTagConfig,
  placeholder: multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig,
  selectedValue: multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig,
}
type multiSelectMultiSelectTokensTypeMenuItemSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type multiSelectMultiSelectTokensTypeMenuItemConfig = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: multiSelectMultiSelectTokensTypeLabelColorConfig,
  optionsLabel: multiSelectMultiSelectTokensTypeLabelConfig,
  option: multiSelectMultiSelectTokensTypeLabelConfig,
  description: multiSelectMultiSelectTokensTypeLabelConfig,
  seperator: multiSelectMultiSelectTokensTypeMenuItemSeperatorConfig,
}
type multiSelectMultiSelectTokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: multiSelectMultiSelectTokensTypeTriggerPaddingConfig,
  item: multiSelectMultiSelectTokensTypeMenuItemConfig,
}
type multiSelectMultiSelectTokensTypeDrawerHeaderConfig = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type multiSelectMultiSelectTokensTypeDrawerSearchConfig = {
  paddingX: string,
  marginTop: string,
  marginBottom: string,
}
type multiSelectMultiSelectTokensTypeDrawerContentConfig = {
  gap: string,
}
type multiSelectMultiSelectTokensTypeDrawerConfig = {
  header: multiSelectMultiSelectTokensTypeDrawerHeaderConfig,
  search: multiSelectMultiSelectTokensTypeDrawerSearchConfig,
  content: multiSelectMultiSelectTokensTypeDrawerContentConfig,
}
type multiSelectTokensType = {
  gap: string,
  label: multiSelectMultiSelectTokensTypeLabelConfig,
  subLabel: multiSelectMultiSelectTokensTypeLabelConfig,
  hintText: multiSelectMultiSelectTokensTypeLabelConfig,
  errorMessage: multiSelectMultiSelectTokensTypeErrorMessageConfig,
  required: multiSelectMultiSelectTokensTypeRequiredConfig,
  trigger: multiSelectMultiSelectTokensTypeTriggerConfig,
  menu: multiSelectMultiSelectTokensTypeMenuConfig,
  drawer: multiSelectMultiSelectTokensTypeDrawerConfig,
}
type responsiveMultiSelectTokens = {
  sm: multiSelectTokensType,
  lg: multiSelectTokensType,
}
