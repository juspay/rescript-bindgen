/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigPopis => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("ContextMenu") @react.component
external make: (
  ~onOpenChange: (bool, RootSharedTypes.menuRootChangeEventDetails) => unit=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  ~disabled: bool=?,
  @as("open") ~open_: bool=?,
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.autocompleteRootActions>>=?,
  ~handle: RootSharedTypes.menuHandleV8opj=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
  ~highlightItemOnHover: bool=?,
  ~loopFocus: bool=?,
  ~orientation: RootSharedTypes.menuRootOrientation=?,
  ~closeParentOnEsc: bool=?,
) => React.element = "SubmenuRoot"
