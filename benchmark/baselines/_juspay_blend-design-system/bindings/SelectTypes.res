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
  tooltipProps?: MultiSelectSingleSelectTypes.tooltipPropsConfig,
  disableTruncation?: bool,
  isDisabled?: bool,
}
type selectMenuGroupType2 = {
  groupLabel?: string,
  items: array<selectMenuItemType2>,
  showSeparator?: bool,
}
