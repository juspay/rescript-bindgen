/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV2rd08<'a> => React.element) => React.element = "%identity"

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
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.autocompleteRootActions>>=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
  ~handle: RootSharedTypes.menuHandleV18lc1<'a>=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
) => React.element = "Root"
