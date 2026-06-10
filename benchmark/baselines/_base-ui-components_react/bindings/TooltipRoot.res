@module("@base-ui-components/react") @scope("Tooltip") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, ComponentsMenubarRootStoreToastTypes.tooltipRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disableHoverablePopup: bool=?,
  ~trackCursorAxis: ComponentsMenubarRootStoreToastTypes.trackCursorAxis=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~disabled: bool=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.tooltipHandle<'a>=?,
  ~children: React.element=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "Root"
