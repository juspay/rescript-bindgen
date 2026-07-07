type selectSelectMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec selectMenuItemTypeV1uul1 = {
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
  subMenu?: array<selectMenuItemTypeV1uul1>,
  tooltip?: React.element,
  tooltipProps?: selectSelectMenuItemTypeTooltipPropsConfig,
  disableTruncation?: bool,
  isDisabled?: bool,
}
type selectMenuGroupTypeK8olm = {
  groupLabel?: string,
  items: array<selectMenuItemTypeV1uul1>,
  showSeparator?: bool,
}
