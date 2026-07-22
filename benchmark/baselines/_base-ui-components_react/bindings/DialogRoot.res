/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV6oib1<'a> => React.element) => React.element = "%identity"

type props<'a> = {
  @as("open") open_?: bool,
  defaultOpen?: bool,
  modal?: CommonTypes.boolOrTrapFocus,
  onOpenChange?: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  disablePointerDismissal?: bool,
  actionsRef?: React.ref<Nullable.t<RootSharedTypes.dialogRootActions>>,
  handle?: RootSharedTypes.dialogHandleV1h2j62<'a>,
  children?: React.element,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  triggerId?: Nullable.t<string>,
  defaultTriggerId?: Nullable.t<string>,
}

@module("@base-ui-components/react") @scope("Dialog")
external make: React.component<props<'a>> = "Root"
