type selectMenuSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type selectMenuVariant =
  | @as("container") Container
  | @as("no-container") NoContainer
type selectMenuAlignment =
  | @as("start") Start
  | @as("center") Center
  | @as("end") End
type selectMenuSide =
  | @as("top") Top
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
type singleSelectSelectMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec selectMenuItemType = {
  label: string,
  value: string,
  checked?: bool,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  disabled?: bool,
  onClick?: unit => unit,
  subMenu?: array<selectMenuItemType>,
  tooltip?: React.element,
  tooltipProps?: singleSelectSelectMenuItemTypeTooltipPropsConfig,
  disableTruncation?: bool,
}
type selectMenuGroupType = {
  groupLabel?: string,
  items: array<selectMenuItemType>,
  showSeparator?: bool,
}
type singleSelectSkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type singleSelectProps = {
  label?: string,
  subLabel?: string,
  hintText?: string,
  required?: bool,
  helpIconText?: string,
  placeholder: string,
  size?: selectMenuSize,
  items: array<selectMenuGroupType>,
  variant?: selectMenuVariant,
  selected: string,
  onSelect: string => unit,
  enableSearch?: bool,
  searchPlaceholder?: string,
  slot?: React.element,
  disabled?: bool,
  name?: string,
  customTrigger?: React.element,
  useDrawerOnMobile?: bool,
  alignment?: selectMenuAlignment,
  side?: selectMenuSide,
  sideOffset?: float,
  alignOffset?: float,
  minMenuWidth?: float,
  maxMenuWidth?: float,
  maxMenuHeight?: float,
  inline?: bool,
  onBlur?: unit => unit,
  onFocus?: unit => unit,
  error?: bool,
  errorMessage?: string,
  fullWidth?: bool,
  enableVirtualization?: bool,
  virtualListItemHeight?: float,
  virtualListOverscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  loadingComponent?: React.element,
  skeleton?: singleSelectSkeletonProps,
  maxTriggerWidth?: float,
  minTriggerWidth?: float,
  allowCustomValue?: bool,
  customValueLabel?: string,
  singleSelectGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  allowDeselect?: bool,
}
type singleSelectSingleSelectTokensTypeLabelColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  selected: string,
  focus: string,
  focusVisible: string,
}
type singleSelectSingleSelectTokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: singleSelectSingleSelectTokensTypeLabelColorConfig,
}
type singleSelectSingleSelectTokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type singleSelectSingleSelectTokensTypeRequiredConfig = {
  color: string,
}
type singleSelectSingleSelectTokensTypeTriggerHeightSmConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type singleSelectSingleSelectTokensTypeTriggerHeightConfig = {
  sm: singleSelectSingleSelectTokensTypeTriggerHeightSmConfig,
  md: singleSelectSingleSelectTokensTypeTriggerHeightSmConfig,
  lg: singleSelectSingleSelectTokensTypeTriggerHeightSmConfig,
}
type singleSelectSingleSelectTokensTypeTriggerPaddingSmContainerConfig = {
  x: string,
  y: string,
}
type singleSelectSingleSelectTokensTypeTriggerPaddingSmConfig = {
  container: singleSelectSingleSelectTokensTypeTriggerPaddingSmContainerConfig,
  @as("no-container") noContainer: singleSelectSingleSelectTokensTypeTriggerPaddingSmContainerConfig,
}
type singleSelectSingleSelectTokensTypeTriggerPaddingConfig = {
  sm: singleSelectSingleSelectTokensTypeTriggerPaddingSmConfig,
  md: singleSelectSingleSelectTokensTypeTriggerPaddingSmConfig,
  lg: singleSelectSingleSelectTokensTypeTriggerPaddingSmConfig,
}
type singleSelectSingleSelectTokensTypeTriggerBackgroundColorContainerConfig = {
  hover: string,
  @as("open") open_: string,
  error: string,
  focus: string,
  closed: string,
}
type singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig = {
  container: singleSelectSingleSelectTokensTypeTriggerBackgroundColorContainerConfig,
  @as("no-container") noContainer: singleSelectSingleSelectTokensTypeTriggerBackgroundColorContainerConfig,
}
type singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type singleSelectSingleSelectTokensTypeTriggerConfig = {
  height: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
  padding: singleSelectSingleSelectTokensTypeTriggerPaddingConfig,
  borderRadius: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
  boxShadow: singleSelectSingleSelectTokensTypeTriggerHeightSmConfig,
  backgroundColor: singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig,
  outline: singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig,
  placeholder: singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig,
  selectedValue: singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig,
}
type singleSelectSingleSelectTokensTypeMenuItemOptionsLabelColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  selected: string,
  focus: string,
  focusVisible: string,
}
type singleSelectSingleSelectTokensTypeMenuItemOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: singleSelectSingleSelectTokensTypeMenuItemOptionsLabelColorConfig,
}
type singleSelectSingleSelectTokensTypeMenuItemSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type singleSelectSingleSelectTokensTypeMenuItemConfig = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: singleSelectSingleSelectTokensTypeLabelColorConfig,
  optionsLabel: singleSelectSingleSelectTokensTypeMenuItemOptionsLabelConfig,
  option: singleSelectSingleSelectTokensTypeMenuItemOptionsLabelConfig,
  description: singleSelectSingleSelectTokensTypeMenuItemOptionsLabelConfig,
  seperator: singleSelectSingleSelectTokensTypeMenuItemSeperatorConfig,
}
type singleSelectSingleSelectTokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: singleSelectSingleSelectTokensTypeTriggerPaddingConfig,
  item: singleSelectSingleSelectTokensTypeMenuItemConfig,
}
type singleSelectSingleSelectTokensTypeDrawerHeaderConfig = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type singleSelectSingleSelectTokensTypeDrawerConfig = {
  header: singleSelectSingleSelectTokensTypeDrawerHeaderConfig,
}
type singleSelectTokensType = {
  gap: string,
  label: singleSelectSingleSelectTokensTypeLabelConfig,
  subLabel: singleSelectSingleSelectTokensTypeLabelConfig,
  hintText: singleSelectSingleSelectTokensTypeLabelConfig,
  errorMessage: singleSelectSingleSelectTokensTypeErrorMessageConfig,
  required: singleSelectSingleSelectTokensTypeRequiredConfig,
  trigger: singleSelectSingleSelectTokensTypeTriggerConfig,
  menu: singleSelectSingleSelectTokensTypeMenuConfig,
  drawer: singleSelectSingleSelectTokensTypeDrawerConfig,
}
type responsiveSingleSelectTokens = {
  sm: singleSelectTokensType,
  lg: singleSelectTokensType,
}
