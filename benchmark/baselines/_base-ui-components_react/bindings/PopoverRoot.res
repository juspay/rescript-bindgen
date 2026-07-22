/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV6oib1<'a> => React.element) => React.element = "%identity"

type props<'a> = {
  defaultOpen?: bool,
  @as("open") open_?: bool,
  onOpenChange?: (bool, RootSharedTypes.popoverRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  actionsRef?: React.ref<Nullable.t<RootSharedTypes.dialogRootActions>>,
  modal?: CommonTypes.boolOrTrapFocus,
  triggerId?: Nullable.t<string>,
  defaultTriggerId?: Nullable.t<string>,
  handle?: RootSharedTypes.popoverHandleAxlr9<'a>,
  children?: React.element,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
}

@module("@base-ui-components/react") @scope("Popover")
external make: React.component<props<'a>> = "Root"
