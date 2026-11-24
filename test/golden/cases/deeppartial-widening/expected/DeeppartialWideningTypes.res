type buttonTokens = {
  color: string,
  size: float,
}
type responsiveButtonTokens = {
  sm: buttonTokens,
  lg: buttonTokens,
}
type guard = {
  a: string,
  b: float,
}
type deeppartialWideningComponentTokensSmConfig = {
  color?: string,
  size?: float,
}
type deeppartialWideningComponentTokensConfig = {
  sm?: deeppartialWideningComponentTokensSmConfig,
  lg?: deeppartialWideningComponentTokensSmConfig,
}
type deeppartialWideningFnsConfig = {
  a?: unit => string,
  b?: unit => float,
}
external deeppartialWideningComponentTokensConfigFromFull: responsiveButtonTokens => deeppartialWideningComponentTokensConfig = "%identity"
external deeppartialWideningComponentTokensSmConfigFromFull: buttonTokens => deeppartialWideningComponentTokensSmConfig = "%identity"
