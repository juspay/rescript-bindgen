@module("@juspay/blend-design-system") @react.component
external make: (
  ~directoryData: array<DirectoryTypes.directoryData>,
  ~idPrefix: string=?,
  ~activeItem: string=?,
  ~onActiveItemChange: string => unit=?,
  ~defaultActiveItem: string=?,
  ~iconOnlyMode: bool=?,
) => React.element = "Directory"
