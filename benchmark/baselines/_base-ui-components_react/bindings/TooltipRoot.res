@module("@base-ui-components/react") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: TooltipRootChangeEventDetails) => void`
  ~onOpenChangeComplete: bool => unit=?,
  ~disableHoverablePopup: bool=?,
  ~trackCursorAxis: ComponentsMenubarRootStoreToastTypes.trackCursorAxis=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~disabled: bool=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.tooltipHandle<'a>=?,
  ~children: React.element=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "TooltipRoot"
