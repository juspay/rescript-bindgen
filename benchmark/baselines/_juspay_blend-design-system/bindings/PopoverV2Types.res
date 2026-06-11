type paddingConfig17 = {
  left: ButtonSharedTypes.slotMaxHeightConfig,
  right: ButtonSharedTypes.slotMaxHeightConfig,
  top: ButtonSharedTypes.slotMaxHeightConfig,
  bottom: ButtonSharedTypes.slotMaxHeightConfig,
}
type headingConfig5 = {
  color: string,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  lineHeight: ButtonSharedTypes.slotMaxHeightConfig,
  @as("IconSize") iconSize: InputsTypes.widthConfig2,
}
type descriptionConfig3 = {
  color: string,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  lineHeight: ButtonSharedTypes.slotMaxHeightConfig,
}
type topContainerConfig2 = {
  gap: ButtonSharedTypes.slotMaxHeightConfig,
  heading: headingConfig5,
  description: descriptionConfig3,
}
type bottomContainerConfig2 = {
  gap: ButtonSharedTypes.slotMaxHeightConfig,
}
type popoverV2TokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.shadowsConfig,
  gap: ButtonSharedTypes.slotMaxHeightConfig,
  zIndex: string,
  borderRadius: ButtonSharedTypes.slotMaxHeightConfig,
  padding: paddingConfig17,
  @as("TopContainer") topContainer: topContainerConfig2,
  bottomContainer: bottomContainerConfig2,
}
type responsivePopoverV2Tokens = {
  sm: popoverV2TokenType,
  lg: popoverV2TokenType,
}
