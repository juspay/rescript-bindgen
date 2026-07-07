type selectSelectMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec selectMenuItemTypeSksq2 = {
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
  subMenu?: array<selectMenuItemTypeSksq2>,
  tooltip?: React.element,
  tooltipProps?: selectSelectMenuItemTypeTooltipPropsConfig,
  disableTruncation?: bool,
  isDisabled?: bool,
}
type selectMenuGroupTypeV37srr = {
  groupLabel?: string,
  items: array<selectMenuItemTypeSksq2>,
  showSeparator?: bool,
}
