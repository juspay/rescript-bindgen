/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfigV2rd08<'a> => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("Tooltip") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.tooltipRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disableHoverablePopup: bool=?,
  ~trackCursorAxis: RootSharedTypes.rootTrackCursorAxis=?,
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.autocompleteRootActions>>=?,
  ~disabled: bool=?,
  ~handle: RootSharedTypes.tooltipHandleV1bmbk<'a>=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
) => React.element = "Root"
