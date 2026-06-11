@module("@base-ui-components/react") @scope("ContextMenu") @react.component
external make: (
  ~onOpenChange: (bool, RootSharedTypes.contextMenuRootChangeEventDetails) => unit=?,
  ~children: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
  ~disabled: bool=?,
  @as("open") ~open_: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: RootSharedTypes.menuHandle=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
  ~highlightItemOnHover: bool=?,
  ~loopFocus: bool=?,
  ~orientation: RootSharedTypes.menuRootOrientation=?,
  ~closeParentOnEsc: bool=?,
) => React.element = "Root"
