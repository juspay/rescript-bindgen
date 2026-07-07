@module("@juspay/blend-design-system") @react.component
external make: (
  ~position: SnackbarV2Types.snackbarV2Position=?,
  ~dismissOnClickAway: bool=?,
  ~maxWidth: HighchartsSharedTypes.stringOrNumber=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SnackbarV2"
