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
type singleSelectSingleSelectTokensTypeLabelColorConfig = {
  disabled: string,
  active: string,
  default: string,
  hover: string,
  focus: string,
  focusVisible: string,
  selected: string,
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
type singleSelectSingleSelectTokensTypeTriggerBoxShadowConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type singleSelectSingleSelectTokensTypeTriggerHeightConfig = {
  sm: singleSelectSingleSelectTokensTypeTriggerBoxShadowConfig,
  md: singleSelectSingleSelectTokensTypeTriggerBoxShadowConfig,
  lg: singleSelectSingleSelectTokensTypeTriggerBoxShadowConfig,
}
type singleSelectUseThemeContainerConfig = {
  hover: string,
  error: string,
  focus: string,
  @as("open") open_: string,
  closed: string,
}
type singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig = {
  container: singleSelectUseThemeContainerConfig,
  @as("no-container") noContainer: singleSelectUseThemeContainerConfig,
}
type singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type singleSelectSingleSelectTokensTypeTriggerConfig = {
  height: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
  padding: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
  borderRadius: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
  boxShadow: singleSelectSingleSelectTokensTypeTriggerBoxShadowConfig,
  backgroundColor: singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig,
  outline: singleSelectSingleSelectTokensTypeTriggerBackgroundColorConfig,
  placeholder: singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig,
  selectedValue: singleSelectSingleSelectTokensTypeTriggerPlaceholderConfig,
}
type __typeXfhe52 = {
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
  optionsLabel: singleSelectSingleSelectTokensTypeLabelConfig,
  option: singleSelectSingleSelectTokensTypeLabelConfig,
  description: singleSelectSingleSelectTokensTypeLabelConfig,
  seperator: __typeXfhe52,
}
type singleSelectSingleSelectTokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: singleSelectSingleSelectTokensTypeTriggerHeightConfig,
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
type singleSelectSelectMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec selectMenuItemTypeSingleSelect = {
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
  subMenu?: array<selectMenuItemTypeSingleSelect>,
  tooltip?: React.element,
  tooltipProps?: singleSelectSelectMenuItemTypeTooltipPropsConfig,
  disableTruncation?: bool,
}
type selectMenuGroupTypeSingleSelect = {
  groupLabel?: string,
  items: array<selectMenuItemTypeSingleSelect>,
  showSeparator?: bool,
}
type singleSelectSkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type singleSelectProps = {
  searchText?: string,
  onSearchChange?: string => unit,
  isSearchLoading?: bool,
  emptyStateText?: string,
  label?: string,
  subLabel?: string,
  hintText?: string,
  required?: bool,
  helpIconText?: string,
  placeholder: string,
  size?: selectMenuSize,
  items: array<selectMenuGroupTypeSingleSelect>,
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
  menuFooter?: React.element,
}
