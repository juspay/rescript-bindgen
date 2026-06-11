@module("@base-ui-components/react") @scope("Dialog") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~onOpenChange: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~disablePointerDismissal: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~handle: RootSharedTypes.dialogHandle2<'a>=?,
  ~children: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
) => React.element = "Root"
