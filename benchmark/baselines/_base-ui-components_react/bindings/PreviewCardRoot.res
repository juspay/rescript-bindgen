@module("@base-ui-components/react") @scope("PreviewCard") @react.component
external make: (
  ~children: React.element=?,
  ~defaultOpen: bool=?,
  @as("open") ~open_: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.previewCardRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~actionsRef: React.ref<Nullable.t<RootSharedTypes.autocompleteRootActions>>=?,
) => React.element = "Root"
