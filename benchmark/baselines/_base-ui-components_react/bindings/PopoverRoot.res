@module("@base-ui-components/react") @scope("Popover") @react.component
external make: (
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.popoverRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~modal: CommonTypes.boolOrTrapFocus=?,
  ~triggerId: Nullable.t<string>=?,
  ~defaultTriggerId: Nullable.t<string>=?,
  ~handle: RootSharedTypes.popoverHandle<'a>=?,
  ~children: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
) => React.element = "Root"
