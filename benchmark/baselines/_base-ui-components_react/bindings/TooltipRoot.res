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
  ~children: React.element=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "Root"
