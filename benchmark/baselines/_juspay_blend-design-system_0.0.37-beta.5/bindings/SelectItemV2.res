@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: SelectV2Types.selectV2ItemType,
  ~onSelect: string => unit,
  ~itemTokens: SelectV2Types.selectV2MenuItemTokensBase,
  ~index: int=?,
  ~selectedPosition: SelectV2Types.selectV2SelectedPosition=?,
  ~className: string=?,
  ~mode: SelectV2Types.selectV2Mode,
  ~selected: string=?,
  ~showCheckmark: bool=?,
  ~selectedValues: array<string>=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SelectItemV2"
