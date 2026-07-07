/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV2rd08<'a> => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("Dialog") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~onOpenChange: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disablePointerDismissal: bool=?,
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.dialogRootActions>>=?,
  ~handle: RootSharedTypes.dialogHandleV28v13<'a>=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
) => React.element = "Root"
