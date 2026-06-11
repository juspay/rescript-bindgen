@module("@base-ui-components/react") @scope("AlertDialog") @react.component
external make: (
  ~onOpenChange: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: RootSharedTypes.dialogHandle<'a>=?,
  ~children: React.element=?,
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "Root"
