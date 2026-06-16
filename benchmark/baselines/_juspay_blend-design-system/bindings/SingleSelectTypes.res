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
type tooltipPropsConfig = {
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
  tooltipProps?: tooltipPropsConfig,
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
type colorConfig13 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type labelConfig5 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig13,
}
type errorMessageConfig3 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type requiredConfig3 = {
  color: string,
}
type smConfig11 = {
  container: string,
  @as("no-container") noContainer: string,
}
type heightConfig2 = {
  sm: smConfig11,
  md: smConfig11,
  lg: smConfig11,
}
type containerConfig7 = {
  x: string,
  y: string,
}
type smConfig12 = {
  container: containerConfig7,
  @as("no-container") noContainer: containerConfig7,
}
type paddingConfig21 = {
  sm: smConfig12,
  md: smConfig12,
  lg: smConfig12,
}
type containerConfig8 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  closed: string,
  error: string,
}
type backgroundColorConfig9 = {
  container: containerConfig8,
  @as("no-container") noContainer: containerConfig8,
}
type placeholderConfig3 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type triggerConfig6 = {
  height: heightConfig2,
  padding: paddingConfig21,
  borderRadius: heightConfig2,
  boxShadow: smConfig11,
  backgroundColor: backgroundColorConfig9,
  outline: backgroundColorConfig9,
  placeholder: placeholderConfig3,
  selectedValue: placeholderConfig3,
}
type colorConfig14 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type optionsLabelConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig14,
}
type seperatorConfig3 = {
  color: string,
  height: string,
  margin: string,
}
type itemConfig7 = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: colorConfig13,
  optionsLabel: optionsLabelConfig2,
  option: optionsLabelConfig2,
  description: optionsLabelConfig2,
  seperator: seperatorConfig3,
}
type menuConfig3 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: paddingConfig21,
  item: itemConfig7,
}
type headerConfig12 = {
  paddingX: string,
  paddingBottom: string,
  borderBottom: string,
}
type drawerConfig2 = {
  header: headerConfig12,
}
type singleSelectTokensType = {
  gap: string,
  label: labelConfig5,
  subLabel: labelConfig5,
  hintText: labelConfig5,
  errorMessage: errorMessageConfig3,
  required: requiredConfig3,
  trigger: triggerConfig6,
  menu: menuConfig3,
  drawer: drawerConfig2,
}
type responsiveSingleSelectTokens = {
  sm: singleSelectTokensType,
  lg: singleSelectTokensType,
}
