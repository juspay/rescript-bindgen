type popoverV2PopoverV2TokenTypeGapConfig = {
  sm: string,
  md: string,
  lg: string,
}
type popoverV2PopoverV2TokenTypePaddingConfig = {
  left: popoverV2PopoverV2TokenTypeGapConfig,
  right: popoverV2PopoverV2TokenTypeGapConfig,
  top: popoverV2PopoverV2TokenTypeGapConfig,
  bottom: popoverV2PopoverV2TokenTypeGapConfig,
}
type popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig = {
  sm: string,  // ⚠️ REVIEW — was `string | number | RuleSet<any> | StyledObject<BaseObject> | StyleFunction<BaseObject>` — match the real type by hand
  md: string,  // ⚠️ REVIEW — was `string | number | RuleSet<any> | StyledObject<BaseObject> | StyleFunction<BaseObject>` — match the real type by hand
  lg: string,  // ⚠️ REVIEW — was `string | number | RuleSet<any> | StyledObject<BaseObject> | StyleFunction<BaseObject>` — match the real type by hand
}
type popoverV2PopoverV2TokenTypeTopContainerHeadingConfig = {
  color: string,
  fontSize: popoverV2PopoverV2TokenTypeGapConfig,
  fontWeight: popoverV2PopoverV2TokenTypeGapConfig,
  lineHeight: popoverV2PopoverV2TokenTypeGapConfig,
  @as("IconSize") iconSize: popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig,
}
type popoverV2PopoverV2TokenTypeTopContainerDescriptionConfig = {
  color: string,
  fontSize: popoverV2PopoverV2TokenTypeGapConfig,
  fontWeight: popoverV2PopoverV2TokenTypeGapConfig,
  lineHeight: popoverV2PopoverV2TokenTypeGapConfig,
}
type popoverV2PopoverV2TokenTypeTopContainerConfig = {
  gap: popoverV2PopoverV2TokenTypeGapConfig,
  heading: popoverV2PopoverV2TokenTypeTopContainerHeadingConfig,
  description: popoverV2PopoverV2TokenTypeTopContainerDescriptionConfig,
}
type popoverV2PopoverV2TokenTypeBottomContainerConfig = {
  gap: popoverV2PopoverV2TokenTypeGapConfig,
}
type popoverV2TokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.tokensFoundationTokenTypeShadowsConfig,
  gap: popoverV2PopoverV2TokenTypeGapConfig,
  zIndex: string,
  borderRadius: popoverV2PopoverV2TokenTypeGapConfig,
  padding: popoverV2PopoverV2TokenTypePaddingConfig,
  @as("TopContainer") topContainer: popoverV2PopoverV2TokenTypeTopContainerConfig,
  bottomContainer: popoverV2PopoverV2TokenTypeBottomContainerConfig,
}
type responsivePopoverV2Tokens = {
  sm: popoverV2TokenType,
  lg: popoverV2TokenType,
}
