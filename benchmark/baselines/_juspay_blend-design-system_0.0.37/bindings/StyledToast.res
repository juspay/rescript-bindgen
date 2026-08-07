type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  ...SnackbarV2Types.snackbarV2Dimensions,
  header: string,
  description?: string,
  variant: SnackbarV2Types.snackbarV2Variant,
  slot?: React.element,
  onClose?: unit => unit,
  actionButton?: SnackbarV2Types.snackbarV2Action,
  toastId?: CommonTypes.stringOrNumber,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StyledToast"
