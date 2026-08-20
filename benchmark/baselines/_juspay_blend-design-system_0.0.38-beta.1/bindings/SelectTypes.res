type selectSelectTokenTypesTriggerContainerConfig = {
  gap: string,
}
type selectSelectTokenTypesTriggerLabelConfig = {
  color: string,
  fontWeight: string,
  fontSize: string,
}
type __typeV1hngb = {
  sm: string,
  md: string,
  lg: string,
}
type __typeV13zht = {
  weight: string,
  size: __typeV1hngb,
}
type __typeV1okzr3 = {
  x: string,
  y: string,
}
type __typeNt0cu = {
  sm: __typeV1okzr3,
  md: __typeV1okzr3,
  lg: __typeV1okzr3,
}
type selectSelectTokenTypesTriggerSelectedValueConfig = {
  color: string,
  font: __typeV13zht,
  padding: __typeNt0cu,
}
type selectSelectTokenTypesTriggerConfig = {
  container: selectSelectTokenTypesTriggerContainerConfig,
  label: selectSelectTokenTypesTriggerLabelConfig,
  selectedValue: selectSelectTokenTypesTriggerSelectedValueConfig,
}
type selectSelectTokenTypesContainerConfig = {
  backgroundColor: string,
  border: string,
}
type selectSelectTokenTypesItemConfig = {
  selectedBackgroundColor: string,
  hoverBackgroundColor: string,
  highlightedBackgroundColor: string,
  color: string,
  selectedColor: string,
  subLabelColor: string,
  checkmarkColor: string,
}
type selectSelectTokenTypesGroupLabelConfig = {
  color: string,
}
type selectSelectTokenTypesSubTriggerConfig = {
  hoverBackgroundColor: string,
  highlightedBackgroundColor: string,
  color: string,
  subLabelColor: string,
}
type selectSelectTokenTypesSubContentConfig = {
  backgroundColor: string,
  color: string,
}
type selectSelectTokenTypesSeparatorConfig = {
  backgroundColor: string,
}
type selectSelectTokenTypesTriggerColorsConfig = {
  backgroundColor: string,
  hoverBackgroundColor: string,
  focusBackgroundColor: string,
  outlineBorder: string,
  outlineBorderFocus: string,
  caretColor: string,
  chevronIconColor: string,
  placeholderColor: string,
}
type selectSelectTokenTypesClearButtonConfig = {
  backgroundColor: string,
  hoverBackgroundColor: string,
  focusBackgroundColor: string,
  outlineBorder: string,
  outlineBorderFocus: string,
  iconColor: string,
}
type selectSelectTokenTypesLabelColorsConfig = {
  subLabel: string,
  hintText: string,
  required: string,
  helpIcon: string,
}
type selectTokenTypes = {
  trigger: selectSelectTokenTypesTriggerConfig,
  container: selectSelectTokenTypesContainerConfig,
  item: selectSelectTokenTypesItemConfig,
  groupLabel: selectSelectTokenTypesGroupLabelConfig,
  subTrigger: selectSelectTokenTypesSubTriggerConfig,
  subContent: selectSelectTokenTypesSubContentConfig,
  separator: selectSelectTokenTypesSeparatorConfig,
  triggerColors: selectSelectTokenTypesTriggerColorsConfig,
  clearButton: selectSelectTokenTypesClearButtonConfig,
  labelColors: selectSelectTokenTypesLabelColorsConfig,
  selectionTag: selectSelectTokenTypesSubContentConfig,
  selectedLabels: selectSelectTokenTypesGroupLabelConfig,
}
type responsiveSelectTokens = {
  sm: selectTokenTypes,
  lg: selectTokenTypes,
}
type selectSelectMenuItemTypeTooltipPropsConfig = {
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
  tooltipProps?: selectSelectMenuItemTypeTooltipPropsConfig,
  disableTruncation?: bool,
  isDisabled?: bool,
}
type selectMenuGroupType = {
  groupLabel?: string,
  items: array<selectMenuItemType>,
  showSeparator?: bool,
}
type selectSearchControlProps = {
  searchText?: string,
  onSearchChange?: string => unit,
  isSearchLoading?: bool,
  emptyStateText?: string,
}
