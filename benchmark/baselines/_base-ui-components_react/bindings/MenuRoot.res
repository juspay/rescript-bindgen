@module("@base-ui-components/react") @scope("Menu") @react.component
external make: (
  ~defaultOpen: bool=?,
  ~loopFocus: bool=?,
  ~highlightItemOnHover: bool=?,
  ~modal: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.menuRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  @as("open") ~open_: bool=?,
  ~orientation: RootSharedTypes.menuRootOrientation=?,
  ~disabled: bool=?,
  ~closeParentOnEsc: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
  ~handle: RootSharedTypes.menuHandle2<'a>=?,
  ~children: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
) => React.element = "Root"
