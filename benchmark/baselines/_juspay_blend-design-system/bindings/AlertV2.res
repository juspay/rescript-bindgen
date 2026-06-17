type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameSlotStyle,
  @as("type") type_?: AlertV2Types.alertV2Type,
  subType?: AlertV2Types.alertV2SubType,
  slot?: AlertV2Types.alertV2SlotConfig2,
  heading?: string,
  description?: string,
  actions?: AlertV2Types.alertV2Actions,
  closeButton?: AlertV2Types.alertV2CloseButtonConfig2,
  width?: string,
  maxWidth?: string,
  minWidth?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AlertV2"
