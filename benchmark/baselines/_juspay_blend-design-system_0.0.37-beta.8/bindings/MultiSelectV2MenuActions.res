@module("@juspay/blend-design-system") @react.component
external make: (
  ~tokens: EditorSharedTypes.multiSelectV2TokensType,
  ~primaryAction: EditorSharedTypes.multiSelectV2PrimaryActionConfig=?,
  ~secondaryAction: EditorSharedTypes.multiSelectV2SecondaryActionConfig=?,
  ~selected: array<string>,
  ~onClose: unit => unit,
) => React.element = "MultiSelectV2MenuActions"
