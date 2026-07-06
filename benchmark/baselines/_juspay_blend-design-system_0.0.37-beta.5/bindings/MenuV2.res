@module("@juspay/blend-design-system") @react.component
external make: (
  ~trigger: React.element,
  ~items: array<MenuV2Types.menuV2GroupType>=?,
  ~dimensions: MenuV2Types.menuV2Dimensions=?,
  ~enableSearch: bool=?,
  ~searchPlaceholder: string=?,
  ~enableVirtualScrolling: bool=?,
  ~virtualScrolling: MenuV2Types.menuV2VirtualScrollingConfig=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: bool => unit=?,
  ~asModal: bool=?,
  ~alignment: MenuV2Types.menuV2Alignment=?,
  ~side: MenuV2Types.menuV2Side=?,
  ~sideOffset: float=?,
  ~alignOffset: float=?,
  ~collisionBoundaryRef: MenuV2Types.MenuV2CollisionBoundaryRef.t=?,  // ⓘ was `HTMLElement | HTMLElement[]` — opaque; build with MenuV2CollisionBoundaryRef.fromHTMLElement / MenuV2CollisionBoundaryRef.fromHTMLElements
  ~triggerProps: ReactTypes.reactPrimaryActionButtonPropsConfig=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "MenuV2"
