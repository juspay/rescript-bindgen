type keyValuePairSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type keyValuePairStateType =
  | @as("0") Vertical
  | @as("1") Horizontal
type textOverflowMode =
  | @as("wrap") Wrap
  | @as("truncate") Truncate
  | @as("wrap-clamp") WrapClamp
type gapConfig4 = {
  horizontal: string,
  vertical: string,
}
type valueConfig5 = {
  color: string,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: string,
  gap: string,
}
type keyValuePairTokensType = {
  gap: gapConfig4,
  value: valueConfig5,
}
type responsiveKeyValuePairTokens = {
  sm: keyValuePairTokensType,
  lg: keyValuePairTokensType,
}
