@module("@base-ui-components/react") @scope("Popover") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.popoverRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~triggerId: string=?,
  ~defaultTriggerId: string=?,
  ~handle: RootSharedTypes.popoverHandle<'a>=?,
  ~children: React.element=?,
) => React.element = "Root"
