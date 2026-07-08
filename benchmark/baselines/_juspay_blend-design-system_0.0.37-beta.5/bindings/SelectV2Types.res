type selectV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type selectV2Variant =
  | @as("container") Container
  | @as("no-container") NoContainer
type selectV2Alignment =
  | @as("start") Start
  | @as("center") Center
  | @as("end") End
type selectV2Side =
  | @as("top") Top
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
type selectV2SelectedPosition =
  | @as("none") None
  | @as("middle") Middle
  | @as("first") First
  | @as("last") Last
  | @as("only") Only
type selectV2Mode =
  | @as("single") Single
  | @as("multi") Multi
type selectV2ItemStates =
  | @as("active") Active
  | @as("default") Default
  | @as("hover") Hover
  | @as("disabled") Disabled
  | @as("focus") Focus
  | @as("focusVisible") FocusVisible
  | @as("selected") Selected
type selectV2TooltipProps = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type selectV2SkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type rec selectV2ItemType = {
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
  subMenu?: array<selectV2ItemType>,
  tooltip?: React.element,
  tooltipProps?: selectV2TooltipProps,
  disableTruncation?: bool,
}
type selectV2ItemStateToken = {
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  disabled: string,
  selected: string,
}
type selectV2SelectV2MenuItemTokensBaseOptionConfig = {
  fontSize: string,
  fontWeight: string,
  color: selectV2ItemStateToken,
}
type selectV2MenuItemTokensBase = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: selectV2ItemStateToken,
  option: selectV2SelectV2MenuItemTokensBaseOptionConfig,
  description: selectV2SelectV2MenuItemTokensBaseOptionConfig,
}
type useSelectV2MenuBehaviorParams = {
  @as("open") open_: bool,
  enableSearch?: bool,
  searchText: string,
  searchInputRef: React.ref<Nullable.t<Dom.htmlInputElement>>,
  searchContainerRef?: React.ref<Nullable.t<Dom.htmlDivElement>>,
  shouldMeasureSearchHeight?: bool,
  focusSearchOnOpen?: bool,
  focusSearchDelayMs?: float,
  refocusSearchOnTextChange?: bool,
  menuContainerSelector?: string,
  enableVirtualization?: bool,
  onVirtualizedSearchChange?: unit => unit,
  virtualScrollRef?: React.ref<Nullable.t<Dom.htmlDivElement>>,
  onEndReached?: unit => unit,
  hasMore?: bool,
  endReachedThreshold?: float,
}
type useSelectV2MenuBehaviorResult = {
  searchHeight: float,
}
