type props = {
  ...SnackbarV2Types.snackbarV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SnackbarV2"
