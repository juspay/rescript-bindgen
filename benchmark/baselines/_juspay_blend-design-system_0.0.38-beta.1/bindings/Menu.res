type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitSlot,
  trigger: React.element,
  items?: array<HighchartsSharedTypes.menuGroupType>,
  maxHeight?: float,
  minHeight?: float,
  maxWidth?: float,
  minWidth?: float,
  enableSearch?: bool,
  searchPlaceholder?: string,
  searchSortFn?: (array<HighchartsSharedTypes.menuItemType>, string) => array<HighchartsSharedTypes.menuItemType>,
  onEnter?: (string, array<HighchartsSharedTypes.menuGroupType>) => unit,
  enableVirtualScrolling?: bool,
  virtualItemHeight?: HighchartsSharedTypes.menuItemTypeVirtualItemHeight,
  virtualOverscan?: float,
  virtualScrollThreshold?: float,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  asModal?: bool,
  selectionStyle?: HighchartsSharedTypes.menuSelectionStyle,
  selectionMode?: HighchartsSharedTypes.menuSelectionMode,
  closeOnSelect?: bool,
  alignment?: HighchartsSharedTypes.menuAlignment,
  side?: HighchartsSharedTypes.menuSide,
  sideOffset?: float,
  alignOffset?: float,
  collisonBoundaryRef?: ChatInputTypes.ChatInputOverflowMenuPropsCollisonBoundaryRef.t,  // ⓘ was `Element | Element[]` — opaque; build with ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElement / ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElements
  skeleton?: HighchartsSharedTypes.menuSkeletonProps,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Menu"
