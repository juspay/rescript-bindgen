type gapConfig7 = {
  horizontal: string,
  vertical: string,
}
type fontSizeConfig10 = {
  sm: string,
  md: string,
  lg: string,
}
type valueConfig6 = {
  color: string,
  fontSize: fontSizeConfig10,
  fontWeight: string,
  gap: string,
}
type keyValuePairV2TokensType = {
  gap: gapConfig7,
  value: valueConfig6,
}
type responsiveKeyValuePairV2Tokens = {
  sm: keyValuePairV2TokensType,
  lg: keyValuePairV2TokensType,
}
