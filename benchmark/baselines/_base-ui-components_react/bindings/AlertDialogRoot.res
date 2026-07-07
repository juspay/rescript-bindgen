/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV2rd08<'a> => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("AlertDialog") @react.component
external make: (
  ~onOpenChange: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit=?,
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.dialogRootActions>>=?,
  ~handle: RootSharedTypes.dialogHandleH0u48<'a>=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
) => React.element = "Root"
