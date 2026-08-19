type selectListV2BaseProps = {
  label?: string,
  @as("aria-label") ariaLabel?: string,
  name?: string,
  disabled?: bool,
  size?: SelectV2Types.selectV2Size,
  variant?: SelectV2Types.selectV2Variant,
  search?: ContextSharedTypes.selectV2SearchConfig,
  maxHeight?: float,
  enableVirtualization?: bool,
  virtualListItemHeight?: float,
  virtualListOverscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  isLoadingMore?: bool,
  loadingComponent?: React.element,
  skeleton?: SelectV2Types.selectV2SkeletonProps,
  allowCustomValue?: bool,
  customValueLabel?: string,
}
type rec selectListV2ItemType = {
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
  tooltip?: React.element,
  tooltipProps?: SelectV2Types.selectV2TooltipProps,
  disableTruncation?: bool,
  alwaysSelected?: bool,
  subMenu?: array<selectListV2ItemType>,
}
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Label({…}); `kind` is auto-filled by @tag.
@tag("kind")
type selectListV2Row =
  | @as("label") Label({id: string, label: string, groupIndex: float})
  | @as("separator") Separator({id: string, groupIndex: float})
  | @as("item") Item({id: string, item: selectListV2ItemType, itemIndex: float, groupIndex: float})
type selectListV2SelectListV2ChromeTokensGroupLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type selectListV2SelectListV2ChromeTokensSeparatorConfig = {
  height: string,
  color: string,
  margin: string,
}
type selectListV2SelectListV2ChromeTokensListPaddingConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type selectListV2ChromeTokens = {
  itemTokens: SelectV2Types.selectV2MenuItemTokensBase,
  groupLabel: selectListV2SelectListV2ChromeTokensGroupLabelConfig,
  separator: selectListV2SelectListV2ChromeTokensSeparatorConfig,
  listPadding: selectListV2SelectListV2ChromeTokensListPaddingConfig,
  emptyStateColor: string,
  gap: string,
}
type selectListV2VirtualizationConfig = {
  height: float,
  itemHeight: float,
  overscan: float,
  listRef: React.ref<Nullable.t<VirtualListTypes.virtualListRef>>,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  isLoadingMore?: bool,
  paginationKey?: CommonTypes.stringOrNumber,
}
type selectListV2FocusTarget = {
  itemIndex: float,
  rowIndex: float,
  value: string,
  disabled: bool,
}
type useSelectListNavigationOptions = {
  targets: array<selectListV2FocusTarget>,
  virtualListRef?: React.ref<Nullable.t<VirtualListTypes.virtualListRef>>,
  onTypeahead?: string => unit,
}
type selectListV2UseSelectListNavigationConfig = {
  activeItemIndex: float,
  getItemRef: (float, string) => Nullable.t<Dom.element> => unit,
  handleKeyDown: ReactEvent.Keyboard.t => unit,
  focusFirstItem: unit => unit,
}
type selectListV2GroupType = {
  groupLabel?: string,
  items: array<selectListV2ItemType>,
  showSeparator?: bool,
}
type selectListV2GetSelectListV2FocusTargetsIsRowDisabledConfig = {
  id: string,
  kind: [#"item"],
  item: selectListV2ItemType,
  itemIndex: float,
  groupIndex: float,
}
