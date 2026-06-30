type keyValuePairV2KeyValuePairV2TokensTypeGapConfig = {
  horizontal: string,
  vertical: string,
}
type keyValuePairV2KeyValuePairV2TokensTypeKeyConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type keyValuePairV2KeyValuePairV2TokensTypeValueFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type keyValuePairV2KeyValuePairV2TokensTypeValueConfig = {
  color: string,
  fontSize: keyValuePairV2KeyValuePairV2TokensTypeValueFontSizeConfig,
  fontWeight: string,
  gap: string,
}
type keyValuePairV2TokensType = {
  gap: keyValuePairV2KeyValuePairV2TokensTypeGapConfig,
  key: keyValuePairV2KeyValuePairV2TokensTypeKeyConfig,
  value: keyValuePairV2KeyValuePairV2TokensTypeValueConfig,
}
type responsiveKeyValuePairV2Tokens = {
  sm: keyValuePairV2TokensType,
  lg: keyValuePairV2TokensType,
}
