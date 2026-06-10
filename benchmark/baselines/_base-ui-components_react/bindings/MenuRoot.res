@module("@base-ui-components/react") @scope("Menu") @react.component
external make: (
  ~defaultOpen: bool=?,
  ~loopFocus: bool=?,
  ~highlightItemOnHover: bool=?,
  ~modal: bool=?,
  ~onOpenChange: (bool, ComponentsMenubarRootStoreToastTypes.menuRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  @as("open") ~open_: bool=?,
  ~orientation: ComponentsMenubarRootStoreToastTypes.menuRootOrientation=?,
  ~disabled: bool=?,
  ~closeParentOnEsc: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.menuHandle2<'a>=?,
  ~children: React.element=?,
) => React.element = "Root"
