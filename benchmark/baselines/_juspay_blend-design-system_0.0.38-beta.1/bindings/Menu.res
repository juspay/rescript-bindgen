type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitSlot,
  trigger: React.element,
  items?: array<ContextSharedTypes.menuGroupType>,
  maxHeight?: float,
  minHeight?: float,
  maxWidth?: float,
  minWidth?: float,
  enableSearch?: bool,
  searchPlaceholder?: string,
  searchSortFn?: (array<ContextSharedTypes.menuItemType>, string) => array<ContextSharedTypes.menuItemType>,
  onEnter?: (string, array<ContextSharedTypes.menuGroupType>) => unit,
  enableVirtualScrolling?: bool,
  virtualItemHeight?: ContextSharedTypes.menuItemTypeVirtualItemHeight,
  virtualOverscan?: float,
  virtualScrollThreshold?: float,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  asModal?: bool,
  selectionStyle?: ContextSharedTypes.menuSelectionStyle,
  selectionMode?: ContextSharedTypes.menuSelectionMode,
  closeOnSelect?: bool,
  alignment?: ContextSharedTypes.menuAlignment,
  side?: ContextSharedTypes.menuSide,
  sideOffset?: float,
  alignOffset?: float,
  collisonBoundaryRef?: ChatInputTypes.ChatInputOverflowMenuPropsCollisonBoundaryRef.t,  // ⓘ was `Element | Element[]` — opaque; build with ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElement / ChatInputOverflowMenuPropsCollisonBoundaryRef.fromElements
  skeleton?: ContextSharedTypes.menuSkeletonProps,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Menu"
