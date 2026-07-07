type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  header: string,
  description?: string,
  variant: SnackbarV2Types.snackbarV2Variant,
  slot?: React.element,
  onClose?: unit => unit,
  actionButton?: SnackbarV2Types.snackbarV2Action,
  toastId?: HighchartsSharedTypes.stringOrNumber,
  width?: string,
  maxWidth?: string,
  minWidth?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StyledToast"
