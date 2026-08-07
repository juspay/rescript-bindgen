type props = {
  position?: SnackbarTypes.snackbarPosition,
  dismissOnClickAway?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Snackbar"
