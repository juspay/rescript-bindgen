@module("@juspay/blend-design-system") @react.component
external make: (
  ~selected: array<string>,
  ~availableValues: array<string>,
  ~onSelectAll: bool => unit,
  ~selectAllText: string,
  ~disabled: bool=?,
) => React.element = "MultiSelectV2SelectAllItem"
