type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  ...AlertV2Types.alertV2Dimensions,
  @as("type") type_?: AlertV2Types.alertV2Type,
  subType?: AlertV2Types.alertV2SubType,
  slot?: AlertV2Types.alertV2SlotConfig,
  heading?: string,
  description?: string,
  actions?: AlertV2Types.alertV2Actions,
  closeButton?: AlertV2Types.alertV2CloseButtonConfig,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AlertV2"
