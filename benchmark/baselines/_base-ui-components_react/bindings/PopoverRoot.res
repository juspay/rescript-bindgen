@module("@base-ui-components/react") @scope("Popover") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: PopoverRootChangeEventDetails) => void`
  ~onOpenChangeComplete: bool => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.popoverHandle<'a>=?,
  ~children: React.element=?,
) => React.element = "Root"
