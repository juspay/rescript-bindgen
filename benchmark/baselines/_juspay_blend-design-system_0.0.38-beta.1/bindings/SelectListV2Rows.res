type props = {
  rows: array<SelectListV2Types.selectListV2Row>,
  chrome: SelectListV2Types.selectListV2ChromeTokens,
  mode: SelectV2Types.selectV2Mode,
  selectedValues: array<string>,
  onToggle: string => unit,
  isItemDisabled: SelectListV2Types.selectListV2ItemType => bool,
  activeItemIndex: float,
  getItemRef: (float, string) => Nullable.t<Dom.element> => unit,
  optionCount: float,
  virtualization?: SelectListV2Types.selectListV2VirtualizationConfig,
  loadingComponent?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SelectListV2Rows"
