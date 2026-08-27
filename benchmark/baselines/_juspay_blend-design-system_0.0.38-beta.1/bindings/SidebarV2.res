type props<'a> = {
  ref?: React.ref<Nullable.t<Dom.element>>,
  height?: string,
  children?: React.element,
  data?: array<HighchartsSharedTypes.directoryData>,
  secondarySidebar?: HighchartsSharedTypes.secondarySidebarInfo,
  topbar?: React.element,
  footer?: React.element,
  sidebarTopSlot?: React.element,
  sidebarCollapseKey?: string,
  merchantInfo?: SharedTypes.merchantInfo,
  rightActions?: React.element,
  enableTopbarAutoHide?: bool,
  isTopbarVisible?: bool,
  onTopbarVisibilityChange?: bool => unit,
  defaultIsTopbarVisible?: bool,
  isExpanded?: bool,
  onExpandedChange?: bool => unit,
  onSidebarStateChange?: HighchartsSharedTypes.sidebarV2SidebarV2PropsOnSidebarStateChange => unit,
  enableIntermediateState?: bool,
  defaultIsExpanded?: bool,
  showMobilePrimaryActionButton?: bool,
  mobilePrimaryActionButtonProps?: ReactTypes.reactSidebarPropsPrimaryActionButtonPropsConfig,
  activeItem?: string,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: string,
  showHierarchyLines?: bool,
  hierarchyLineBorderRadius?: string,
  expandedItems?: HighchartsSharedTypes.DirectoryExpandedItems.t,  // ⓘ was `DirectoryExpandedItems` — opaque; build with DirectoryExpandedItems.fromArray / DirectoryExpandedItems.fromSet
  defaultExpandedItems?: HighchartsSharedTypes.DirectoryExpandedItems.t,  // ⓘ was `DirectoryExpandedItems` — opaque; build with DirectoryExpandedItems.fromArray / DirectoryExpandedItems.fromSet
  onExpandedItemsChange?: array<string> => unit,
  onItemExpand?: (HighchartsSharedTypes.navbarItem, string) => 'a,
  enableVirtualization?: bool,
  virtualization?: HighchartsSharedTypes.directoryVirtualizationConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a>> = "SidebarV2"
