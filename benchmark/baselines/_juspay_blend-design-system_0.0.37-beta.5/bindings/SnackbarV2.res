@module("@juspay/blend-design-system") @react.component
external make: (
  ~position: SnackbarV2Types.snackbarV2Position=?,
  ~dismissOnClickAway: bool=?,
  ~maxWidth: CommonTypes.stringOrNumber=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SnackbarV2"
