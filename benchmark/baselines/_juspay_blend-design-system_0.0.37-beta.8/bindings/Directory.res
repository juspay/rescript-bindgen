@module("@juspay/blend-design-system") @react.component
external make: (
  ~directoryData: Nullable.t<array<DirectoryTypes.directoryData>>,
  ~idPrefix: string=?,
  ~activeItem: Nullable.t<string>=?,
  ~onActiveItemChange: Nullable.t<string> => unit=?,
  ~defaultActiveItem: Nullable.t<string>=?,
  ~iconOnlyMode: bool=?,
) => React.element = "Directory"
