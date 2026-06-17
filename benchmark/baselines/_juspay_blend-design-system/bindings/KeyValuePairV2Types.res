type keyValuePairV2GapConfig = {
  horizontal: string,
  vertical: string,
}
type keyValuePairV2KeyConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type keyValuePairV2FontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type keyValuePairV2ValueConfig = {
  color: string,
  fontSize: keyValuePairV2FontSizeConfig,
  fontWeight: string,
  gap: string,
}
type keyValuePairV2TokensType = {
  gap: keyValuePairV2GapConfig,
  key: keyValuePairV2KeyConfig,
  value: keyValuePairV2ValueConfig,
}
type responsiveKeyValuePairV2Tokens = {
  sm: keyValuePairV2TokensType,
  lg: keyValuePairV2TokensType,
}
