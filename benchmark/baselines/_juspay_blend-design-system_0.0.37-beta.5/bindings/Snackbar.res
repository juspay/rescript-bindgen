@module("@juspay/blend-design-system") @react.component
external make: (
  ~position: SnackbarTypes.snackbarPosition=?,
  ~dismissOnClickAway: bool=?,
) => React.element = "Snackbar"
