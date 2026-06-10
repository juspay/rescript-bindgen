type paddingConfig17 = {
  left: ButtonSkeletonTypes.slotMaxHeightConfig,
  right: ButtonSkeletonTypes.slotMaxHeightConfig,
  top: ButtonSkeletonTypes.slotMaxHeightConfig,
  bottom: ButtonSkeletonTypes.slotMaxHeightConfig,
}
type headingConfig5 = {
  color: string,
  fontSize: ButtonSkeletonTypes.slotMaxHeightConfig,
  fontWeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  lineHeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  @as("IconSize") iconSize: InputsTypes.widthConfig2,
}
type descriptionConfig3 = {
  color: string,
  fontSize: ButtonSkeletonTypes.slotMaxHeightConfig,
  fontWeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  lineHeight: ButtonSkeletonTypes.slotMaxHeightConfig,
}
type topContainerConfig2 = {
  gap: ButtonSkeletonTypes.slotMaxHeightConfig,
  heading: headingConfig5,
  description: descriptionConfig3,
}
type bottomContainerConfig2 = {
  gap: ButtonSkeletonTypes.slotMaxHeightConfig,
}
type popoverV2TokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.shadowsConfig,
  gap: ButtonSkeletonTypes.slotMaxHeightConfig,
  zIndex: string,
  borderRadius: ButtonSkeletonTypes.slotMaxHeightConfig,
  padding: paddingConfig17,
  @as("TopContainer") topContainer: topContainerConfig2,
  bottomContainer: bottomContainerConfig2,
}
type responsivePopoverV2Tokens = {
  sm: popoverV2TokenType,
  lg: popoverV2TokenType,
}
