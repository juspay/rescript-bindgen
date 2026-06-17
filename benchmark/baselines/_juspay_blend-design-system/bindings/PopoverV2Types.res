type popoverV2GapConfig = {
  sm: string,
  md: string,
  lg: string,
}
type popoverV2PaddingConfig = {
  left: popoverV2GapConfig,
  right: popoverV2GapConfig,
  top: popoverV2GapConfig,
  bottom: popoverV2GapConfig,
}
type popoverV2IconSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type popoverV2HeadingConfig = {
  color?: string,
  fontSize: popoverV2GapConfig,
  fontWeight: popoverV2GapConfig,
  lineHeight: popoverV2GapConfig,
  @as("IconSize") iconSize: popoverV2IconSizeConfig,
}
type popoverV2DescriptionConfig = {
  color?: string,
  fontSize: popoverV2GapConfig,
  fontWeight: popoverV2GapConfig,
  lineHeight: popoverV2GapConfig,
}
type popoverV2TopContainerConfig = {
  gap: popoverV2GapConfig,
  heading: popoverV2HeadingConfig,
  description: popoverV2DescriptionConfig,
}
type popoverV2BottomContainerConfig = {
  gap: popoverV2GapConfig,
}
type popoverV2TokenType = {
  background?: string,
  border?: string,
  shadow: TokensTypes.tokensShadowsConfig,
  gap: popoverV2GapConfig,
  zIndex?: string,
  borderRadius: popoverV2GapConfig,
  padding: popoverV2PaddingConfig,
  @as("TopContainer") topContainer: popoverV2TopContainerConfig,
  bottomContainer: popoverV2BottomContainerConfig,
}
type responsivePopoverV2Tokens = {
  sm: popoverV2TokenType,
  lg: popoverV2TokenType,
}
