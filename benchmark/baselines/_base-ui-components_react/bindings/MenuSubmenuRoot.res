@module("@base-ui-components/react") @react.component
external make: (
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: MenuRootChangeEventDetails) => void`
  ~children: React.element=?,
  ~disabled: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.menuHandle=?,
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~highlightItemOnHover: bool=?,
  ~loopFocus: bool=?,
  ~orientation: ComponentsMenubarRootStoreToastTypes.menuRootOrientation=?,
  ~closeParentOnEsc: bool=?,
) => React.element = "MenuSubmenuRoot"
