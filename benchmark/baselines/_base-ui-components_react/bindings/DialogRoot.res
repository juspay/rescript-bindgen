@module("@base-ui-components/react") @scope("Dialog") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~onOpenChange: (bool, ComponentsMenubarRootStoreToastTypes.alertDialogRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disablePointerDismissal: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: ComponentsMenubarRootStoreToastTypes.dialogHandle2<'a>=?,
  ~children: React.element=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
) => React.element = "Root"
