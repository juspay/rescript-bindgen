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
type multiSelectMultiSelectTokensTypeLabelColorConfig = {
  disabled: string,
  active: string,
  default: string,
  hover: string,
  focus: string,
  focusVisible: string,
  selected: string,
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
type multiSelectMultiSelectTokensTypeTriggerBoxShadowConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type multiSelectMultiSelectTokensTypeTriggerHeightConfig = {
  sm: multiSelectMultiSelectTokensTypeTriggerBoxShadowConfig,
  md: multiSelectMultiSelectTokensTypeTriggerBoxShadowConfig,
  lg: multiSelectMultiSelectTokensTypeTriggerBoxShadowConfig,
}
type multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig = {
  container: string,  // ⚪ loose — was `{ hover: BackgroundColor; error: BackgroundColor; focus: BackgroundColor; open: BackgroundColor; closed: Backg`
  @as("no-container") noContainer: string,  // ⚪ loose — was `{ hover: BackgroundColor; error: BackgroundColor; focus: BackgroundColor; open: BackgroundColor; closed: Backg`
}
type multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type multiSelectMultiSelectTokensTypeTriggerConfig = {
  height: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
  padding: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
  borderRadius: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
  boxShadow: multiSelectMultiSelectTokensTypeTriggerBoxShadowConfig,
  backgroundColor: multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig,
  outline: multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig,
  selectionTag: multiSelectMultiSelectTokensTypeTriggerBackgroundColorConfig,
  placeholder: multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig,
  selectedValue: multiSelectMultiSelectTokensTypeTriggerPlaceholderConfig,
}
type multiSelectMultiSelectTokensTypeMenuItemConfig = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: string,  // ⚪ loose — was `{ disabled: BackgroundColor; active: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; focus:`
  optionsLabel: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: { disabled: Color; active: Color;`
  option: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: { disabled: Color; active: Color;`
  description: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: { disabled: Color; active: Color;`
  seperator: string,  // ⚪ loose — was `{ color: Color; height: Height<number | (string & {})>; margin: Margin<number | (string & {})>; }`
}
type multiSelectMultiSelectTokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: multiSelectMultiSelectTokensTypeTriggerHeightConfig,
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
