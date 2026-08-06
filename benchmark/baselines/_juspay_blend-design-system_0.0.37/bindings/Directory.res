type props<'a> = {
  directoryData: Nullable.t<array<DirectoryTypes.directoryData>>,
  idPrefix?: string,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
  iconOnlyMode?: bool,
  showHierarchyLines?: bool,
  hierarchyLineBorderRadius?: string,
  expandedItems?: DirectoryTypes.DirectoryExpandedItems.t,
  defaultExpandedItems?: DirectoryTypes.DirectoryExpandedItems.t,
  onExpandedItemsChange?: array<string> => unit,
  onItemExpand?: (DirectoryTypes.navbarItem, string) => 'a,
  enableVirtualization?: bool,
  virtualization?: DirectoryTypes.directoryVirtualizationConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a>> = "Directory"
