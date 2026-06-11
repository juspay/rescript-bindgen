@module("@base-ui-components/react") @scope("ContextMenu") @react.component
external make: (
  ~onOpenChange: (bool, RootSharedTypes.menuRootChangeEventDetails) => unit=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  @as("open") ~open_: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: RootSharedTypes.menuHandle=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~highlightItemOnHover: bool=?,
  ~loopFocus: bool=?,
  ~orientation: RootSharedTypes.menuRootOrientation=?,
  ~closeParentOnEsc: bool=?,
) => React.element = "SubmenuRoot"
