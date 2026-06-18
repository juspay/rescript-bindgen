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
type singleSelectTooltipPropsConfig = {
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
  tooltipProps?: singleSelectTooltipPropsConfig,
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
  singleSelectGroupPosition?: ButtonTypes.buttonGroupPosition,
  allowDeselect?: bool,
}
type singleSelectColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type singleSelectLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: singleSelectColorConfig,
}
type singleSelectErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type singleSelectRequiredConfig = {
  color: string,
}
type singleSelectSmConfig = {
  container: string,
  @as("no-container") noContainer: string,
}
type singleSelectHeightConfig = {
  sm: singleSelectSmConfig,
  md: singleSelectSmConfig,
  lg: singleSelectSmConfig,
}
type singleSelectContainerConfig = {
  x: string,
  y: string,
}
type singleSelectSmConfig2 = {
  container: singleSelectContainerConfig,
  @as("no-container") noContainer: singleSelectContainerConfig,
}
type singleSelectPaddingConfig = {
  sm: singleSelectSmConfig2,
  md: singleSelectSmConfig2,
  lg: singleSelectSmConfig2,
}
type singleSelectContainerConfig2 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type singleSelectBackgroundColorConfig = {
  container: singleSelectContainerConfig2,
  @as("no-container") noContainer: singleSelectContainerConfig2,
}
type singleSelectPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type singleSelectTriggerConfig = {
  height: singleSelectHeightConfig,
  padding: singleSelectPaddingConfig,
  borderRadius: singleSelectHeightConfig,
  boxShadow: singleSelectSmConfig,
  backgroundColor: singleSelectBackgroundColorConfig,
  outline: singleSelectBackgroundColorConfig,
  placeholder: singleSelectPlaceholderConfig,
  selectedValue: singleSelectPlaceholderConfig,
}
type singleSelectColorConfig2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type singleSelectOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: singleSelectColorConfig2,
}
type singleSelectSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type singleSelectItemConfig = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: singleSelectColorConfig,
  optionsLabel: singleSelectOptionsLabelConfig,
  option: singleSelectOptionsLabelConfig,
  description: singleSelectOptionsLabelConfig,
  seperator: singleSelectSeperatorConfig,
}
type singleSelectMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: singleSelectPaddingConfig,
  item: singleSelectItemConfig,
}
type singleSelectHeaderConfig = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type singleSelectDrawerConfig = {
  header: singleSelectHeaderConfig,
}
type singleSelectTokensType = {
  gap: string,
  label: singleSelectLabelConfig,
  subLabel: singleSelectLabelConfig,
  hintText: singleSelectLabelConfig,
  errorMessage: singleSelectErrorMessageConfig,
  required: singleSelectRequiredConfig,
  trigger: singleSelectTriggerConfig,
  menu: singleSelectMenuConfig,
  drawer: singleSelectDrawerConfig,
}
type responsiveSingleSelectTokens = {
  sm: singleSelectTokensType,
  lg: singleSelectTokensType,
}
