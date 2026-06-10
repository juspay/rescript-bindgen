@module("@base-ui-components/react") @react.component
external make: (
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: AlertDialogRootChangeEventDetails) => void`
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.dialogHandle<'a>=?,
  ~children: React.element=?,
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "AlertDialogRoot"
