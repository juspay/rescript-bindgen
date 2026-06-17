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
type keyValuePairGapConfig = {
  horizontal: string,
  vertical: string,
}
type keyValuePairKeyConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type keyValuePairFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type keyValuePairValueConfig = {
  color: string,
  fontSize: keyValuePairFontSizeConfig,
  fontWeight: string,
  gap: string,
}
type keyValuePairTokensType = {
  gap: keyValuePairGapConfig,
  key: keyValuePairKeyConfig,
  value: keyValuePairValueConfig,
}
type responsiveKeyValuePairTokens = {
  sm: keyValuePairTokensType,
  lg: keyValuePairTokensType,
}
