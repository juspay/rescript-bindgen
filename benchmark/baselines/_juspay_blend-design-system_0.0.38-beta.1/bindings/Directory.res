type props<'a> = {
  directoryData: Nullable.t<array<HighchartsSharedTypes.directoryData>>,
  idPrefix?: string,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
  iconOnlyMode?: bool,
  showHierarchyLines?: bool,
  hierarchyLineBorderRadius?: string,
  expandedItems?: HighchartsSharedTypes.DirectoryExpandedItems.t,
  defaultExpandedItems?: HighchartsSharedTypes.DirectoryExpandedItems.t,
  onExpandedItemsChange?: array<string> => unit,
  onItemExpand?: (HighchartsSharedTypes.navbarItem, string) => 'a,
  onEndReached?: unit => 'a,
  endReachedThreshold?: float,
  enableParentSelection?: bool,
  highlightActivePath?: bool,
  enableVirtualization?: bool,
  virtualization?: HighchartsSharedTypes.directoryVirtualizationConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a>> = "Directory"
