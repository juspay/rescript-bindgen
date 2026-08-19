type spinnerColor =
  | @as("default") Default
  | @as("primary") Primary
  | @as("inverse") Inverse
type spinnerSpinnerTokensTypeAnimationConfig = {
  duration: string,
}
type spinnerSpinnerTokensTypeOverlayConfig = {
  backgroundColor: string,
  zIndex: string,
}
type spinnerTokensType = {
  size: Dict.t<string>,
  strokeWidth: Dict.t<float>,
  colors: Dict.t<string>,
  trackColor: string,
  animation: spinnerSpinnerTokensTypeAnimationConfig,
  overlay: spinnerSpinnerTokensTypeOverlayConfig,
}
type responsiveSpinnerTokens = {
  sm: spinnerTokensType,
  lg: spinnerTokensType,
}
