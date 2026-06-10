type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  @as("type") type_?: AlertV2Types.alertV2Type,
  subType?: AlertV2Types.alertV2SubType,
  slot?: AlertV2Types.slotConfig11,
  heading?: string,
  description?: string,
  actions?: AlertV2Types.alertV2Actions,
  closeButton?: AlertV2Types.closeButtonConfig4,
  width?: string,
  maxWidth?: string,
  minWidth?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AlertV2"
