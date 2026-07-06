type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  @as("type") type_?: AlertV2Types.alertV2Type,
  subType?: AlertV2Types.alertV2SubType,
  slot?: AlertV2Types.alertV2SlotConfig,
  heading?: string,
  description?: string,
  actions?: AlertV2Types.alertV2Actions,
  closeButton?: AlertV2Types.alertV2CloseButtonConfig,
  width?: string,
  maxWidth?: string,
  minWidth?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AlertV2"
