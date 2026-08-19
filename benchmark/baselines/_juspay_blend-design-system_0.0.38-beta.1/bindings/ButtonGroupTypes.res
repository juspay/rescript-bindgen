type buttonGroupButtonGroupTokensTypeGapConfig = {
  default: string,
  stacked: string,
}
type buttonGroupButtonGroupTokensTypeSeparatorConfig = {
  width: string,
  color: string,
}
type buttonGroupTokensType = {
  gap: buttonGroupButtonGroupTokensTypeGapConfig,
  separator: buttonGroupButtonGroupTokensTypeSeparatorConfig,
}
type responsiveButtonGroupTokens = {
  sm: buttonGroupTokensType,
  lg: buttonGroupTokensType,
}
