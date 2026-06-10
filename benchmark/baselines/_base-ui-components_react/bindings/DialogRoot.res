@module("@base-ui-components/react") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: DialogRootChangeEventDetails) => void`
  ~onOpenChangeComplete: bool => unit=?,
  ~disablePointerDismissal: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.dialogHandle2<'a>=?,
  ~children: React.element=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "DialogRoot"
