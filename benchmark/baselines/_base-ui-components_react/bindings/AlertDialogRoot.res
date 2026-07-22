/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV6oib1<'a> => React.element) => React.element = "%identity"

type props<'a> = {
  onOpenChange?: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit,
  actionsRef?: React.ref<Nullable.t<RootSharedTypes.dialogRootActions>>,
  handle?: RootSharedTypes.dialogHandleV1h2j6<'a>,
  children?: React.element,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  @as("open") open_?: bool,
  defaultOpen?: bool,
  onOpenChangeComplete?: bool => unit,
  triggerId?: Nullable.t<string>,
  defaultTriggerId?: Nullable.t<string>,
}

@module("@base-ui-components/react") @scope("AlertDialog")
external make: React.component<props<'a>> = "Root"
