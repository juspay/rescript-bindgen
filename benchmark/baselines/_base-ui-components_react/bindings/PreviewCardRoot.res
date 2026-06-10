@module("@base-ui-components/react") @scope("PreviewCard") @react.component
external make: (
  ~children: React.element=?,
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: PreviewCardRootChangeEventDetails) => void`
  ~onOpenChangeComplete: bool => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Root"
