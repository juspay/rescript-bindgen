type gapConfig8 = {
  sm: string,
  md: string,
  lg: string,
}
type paddingConfig30 = {
  left: gapConfig8,
  right: gapConfig8,
  top: gapConfig8,
  bottom: gapConfig8,
}
type iconSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type headingConfig5 = {
  color: string,
  fontSize: gapConfig8,
  fontWeight: gapConfig8,
  lineHeight: gapConfig8,
  @as("IconSize") iconSize: iconSizeConfig,
}
type descriptionConfig3 = {
  color: string,
  fontSize: gapConfig8,
  fontWeight: gapConfig8,
  lineHeight: gapConfig8,
}
type topContainerConfig2 = {
  gap: gapConfig8,
  heading: headingConfig5,
  description: descriptionConfig3,
}
type bottomContainerConfig2 = {
  gap: gapConfig8,
}
type popoverV2TokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.shadowsConfig,
  gap: gapConfig8,
  zIndex: string,
  borderRadius: gapConfig8,
  padding: paddingConfig30,
  @as("TopContainer") topContainer: topContainerConfig2,
  bottomContainer: bottomContainerConfig2,
}
type responsivePopoverV2Tokens = {
  sm: popoverV2TokenType,
  lg: popoverV2TokenType,
}
