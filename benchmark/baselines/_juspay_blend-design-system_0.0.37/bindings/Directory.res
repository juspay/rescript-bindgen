type props<'a> = {
  directoryData: Nullable.t<array<DirectoryTypes.directoryData>>,
  idPrefix?: string,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
  iconOnlyMode?: bool,
  showHierarchyLines?: bool,
  hierarchyLineBorderRadius?: string,
  expandedItems?: DirectoryTypes.DirectoryExpandedItems.t,  // ⓘ was `DirectoryExpandedItems` — opaque; build with DirectoryExpandedItems.fromArray / DirectoryExpandedItems.fromSet
  defaultExpandedItems?: DirectoryTypes.DirectoryExpandedItems.t,  // ⓘ was `DirectoryExpandedItems` — opaque; build with DirectoryExpandedItems.fromArray / DirectoryExpandedItems.fromSet
  onExpandedItemsChange?: array<string> => unit,
  onItemExpand?: (DirectoryTypes.navbarItem, string) => 'a,
  enableVirtualization?: bool,
  virtualization?: DirectoryTypes.directoryVirtualizationConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a>> = "Directory"
