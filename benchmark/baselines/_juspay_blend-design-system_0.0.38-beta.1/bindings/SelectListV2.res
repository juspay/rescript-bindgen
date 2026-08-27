type props = {
  ...SelectListV2Types.selectListV2BaseProps,
  items: array<HighchartsSharedTypes.singleSelectV2GroupType>,
  selected: string,
  onSelect: string => unit,
  allowDeselect?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SelectListV2"
