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
type tooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: int,
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
  variant?: ButtonSkeletonTypes.skeletonVariant,
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
  singleSelectGroupPosition?: ButtonSkeletonTypes.buttonGroupPosition,
  allowDeselect?: bool,
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
  tooltipProps?: tooltipPropsConfig,
  disableTruncation?: bool,
}
type multiSelectMenuGroupType = {
  groupLabel?: string,
  items: array<multiSelectMenuItemType>,
  showSeparator?: bool,
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
type labelConfig3 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig12,
}
type smConfig8 = {
  container: string,
  @as("no-container") noContainer: string,
}
type heightConfig = {
  sm: smConfig8,
  md: smConfig8,
  lg: smConfig8,
}
type smConfig9 = {
  container: ModalTypes.paddingConfig5,
  @as("no-container") noContainer: ModalTypes.paddingConfig5,
}
type paddingConfig11 = {
  sm: smConfig9,
  md: smConfig9,
  lg: smConfig9,
}
type containerConfig4 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  closed: string,
  error: string,
}
type backgroundColorConfig8 = {
  container: containerConfig4,
  @as("no-container") noContainer: containerConfig4,
}
type countConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
}
type containerConfig5 = {
  count: countConfig,
  text: countConfig,
}
type selectionTagConfig = {
  container: containerConfig5,
  @as("no-container") noContainer: containerConfig5,
}
type triggerConfig5 = {
  height: heightConfig,
  padding: paddingConfig11,
  borderRadius: heightConfig,
  boxShadow: smConfig8,
  backgroundColor: backgroundColorConfig8,
  outline: backgroundColorConfig8,
  selectionTag: selectionTagConfig,
  placeholder: ModalTypes.titleConfig,
  selectedValue: ModalTypes.titleConfig,
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
  optionsLabel: labelConfig3,
  option: labelConfig3,
  description: labelConfig3,
  seperator: seperatorConfig2,
}
type menuConfig2 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: paddingConfig11,
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
type drawerConfig = {
  header: headerConfig11,
  search: searchConfig2,
  content: ChartsTypes.slotsConfig,
}
type multiSelectTokensType = {
  gap: string,
  label: labelConfig3,
  subLabel: labelConfig3,
  hintText: labelConfig3,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  trigger: triggerConfig5,
  menu: menuConfig2,
  drawer: drawerConfig,
}
type responsiveMultiSelectTokens = {
  sm: multiSelectTokensType,
  lg: multiSelectTokensType,
}
type smConfig10 = {
  container: ButtonSkeletonTypes.defaultConfig3,
  @as("no-container") noContainer: ButtonSkeletonTypes.defaultConfig3,
}
type paddingConfig12 = {
  sm: smConfig10,
  md: smConfig10,
  lg: smConfig10,
}
type triggerConfig6 = {
  height: heightConfig,
  padding: paddingConfig12,
  borderRadius: heightConfig,
  boxShadow: smConfig8,
  backgroundColor: backgroundColorConfig8,
  outline: backgroundColorConfig8,
  placeholder: ModalTypes.titleConfig,
  selectedValue: ModalTypes.titleConfig,
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
type optionsLabelConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig13,
}
type itemConfig7 = {
  padding: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: colorConfig12,
  optionsLabel: optionsLabelConfig2,
  option: optionsLabelConfig2,
  description: optionsLabelConfig2,
  seperator: seperatorConfig2,
}
type menuConfig3 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: paddingConfig12,
  item: itemConfig7,
}
type drawerConfig2 = {
  header: headerConfig11,
}
type singleSelectTokensType = {
  gap: string,
  label: labelConfig3,
  subLabel: labelConfig3,
  hintText: labelConfig3,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  trigger: triggerConfig6,
  menu: menuConfig3,
  drawer: drawerConfig2,
}
type responsiveSingleSelectTokens = {
  sm: singleSelectTokensType,
  lg: singleSelectTokensType,
}
