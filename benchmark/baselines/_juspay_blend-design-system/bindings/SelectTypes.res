type tooltipPropsConfig2 = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec selectMenuItemType2 = {
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
  subMenu?: array<selectMenuItemType2>,
  tooltip?: React.element,
  tooltipProps?: tooltipPropsConfig2,
  disableTruncation?: bool,
  isDisabled?: bool,
}
type selectMenuGroupType2 = {
  groupLabel?: string,
  items: array<selectMenuItemType2>,
  showSeparator?: bool,
}
