type keyValuePairV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type keyValuePairV2StateType =
  | @as(0) Vertical
  | @as(1) Horizontal
type keyValuePairV2TextOverflowMode =
  | @as("wrap") Wrap
  | @as("truncate") Truncate
  | @as("wrap-clamp") WrapClamp
type keyValuePairV2TextOverflowMode2 =
  | @as("wrap") Wrap
  | @as("truncate") Truncate
  | @as("wrap-clamp") WrapClamp
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
type keyValuePairV2SlotsValueConfig = {
  left?: React.element,
  right?: React.element,
}
type keyValuePairV2SlotsConfig = {
  key?: React.element,
  value?: keyValuePairV2SlotsValueConfig,
}
