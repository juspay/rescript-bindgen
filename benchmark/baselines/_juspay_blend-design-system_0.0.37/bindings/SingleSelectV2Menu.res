type props = {
  items: array<HighchartsSharedTypes.singleSelectV2GroupType>,
  selected: string,
  onSelect: string => unit,
  trigger: React.element,
  menuDimensions?: HighchartsSharedTypes.selectV2MenuDimensions,
  search?: HighchartsSharedTypes.selectV2SearchConfig,
  disabled?: bool,
  menuPosition?: HighchartsSharedTypes.selectV2MenuPosition,
  collisionBoundary?: ChatInputTypes.ChatInputOverflowMenuPropsCollisonBoundaryRef.t,  // ⓘ was `Element | Element[]` — opaque; build with ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElement / ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElements
  @as("open") open_: bool,
  onOpenChange: bool => unit,
  size?: SelectV2Types.selectV2Size,
  variant?: SelectV2Types.selectV2Variant,
  enableVirtualization?: bool,
  virtualListItemHeight?: float,
  virtualListOverscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  loadingComponent?: React.element,
  skeleton?: SelectV2Types.selectV2SkeletonProps,
  allowCustomValue?: bool,
  customValueLabel?: string,
  menuId?: string,
  menuFooter?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2Menu"
