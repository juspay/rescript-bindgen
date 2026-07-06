type keyValuePairSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type keyValuePairStateType =
  | @as(0) Vertical
  | @as(1) Horizontal
type textOverflowMode =
  | @as("wrap") Wrap
  | @as("truncate") Truncate
  | @as("wrap-clamp") WrapClamp
type keyValuePairKeyValuePairTokensTypeGapConfig = {
  horizontal: string,
  vertical: string,
}
type keyValuePairKeyValuePairTokensTypeKeyConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type keyValuePairKeyValuePairTokensTypeValueFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type keyValuePairKeyValuePairTokensTypeValueConfig = {
  color: string,
  fontSize: keyValuePairKeyValuePairTokensTypeValueFontSizeConfig,
  fontWeight: string,
  gap: string,
}
type keyValuePairTokensType = {
  gap: keyValuePairKeyValuePairTokensTypeGapConfig,
  key: keyValuePairKeyValuePairTokensTypeKeyConfig,
  value: keyValuePairKeyValuePairTokensTypeValueConfig,
}
type responsiveKeyValuePairTokens = {
  sm: keyValuePairTokensType,
  lg: keyValuePairTokensType,
}
