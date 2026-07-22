type props = {
  directoryData: array<DirectoryTypes.directoryData>,
  idPrefix?: string,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
  iconOnlyMode?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Directory"
