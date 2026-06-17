/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (PopupsTypes.popupsChildrenConfig<'a> => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("Tooltip") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.tooltipRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disableHoverablePopup: bool=?,
  ~trackCursorAxis: RootSharedTypes.trackCursorAxis=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~disabled: bool=?,
  ~handle: RootSharedTypes.tooltipHandle<'a>=?,
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
) => React.element = "Root"
