@module("@base-ui-components/react") @scope("ContextMenu") @react.component
external make: (
  ~onOpenChange: (bool, ComponentsMenubarRootStoreToastTypes.menuRootChangeEventDetails) => unit=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  @as("open") ~open_: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.menuHandle=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~highlightItemOnHover: bool=?,
  ~loopFocus: bool=?,
  ~orientation: ComponentsMenubarRootStoreToastTypes.menuRootOrientation=?,
  ~closeParentOnEsc: bool=?,
) => React.element = "SubmenuRoot"
