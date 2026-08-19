type timePickerSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type timePickerTimePickerTokensTypeDropdownColumnConfig = {
  width: string,
  gap: string,
  separator: string,
  header: string,  // ⚪ loose — was `{ color: Color; fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; paddingY: Padding<number |`
}
type timePickerTimePickerTokensTypeDropdownOptionConfig = {
  height: string,
  paddingX: string,
  borderRadius: string,
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: FontSize<number | (string & `
  fontWeight: string,
  color: string,  // ⚪ loose — was `{ default: Color; selected: Color; disabled: Color; }`
  backgroundColor: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; selected: BackgroundColor; disabled: BackgroundColor; }`
  focusOutline: string,
}
type timePickerTimePickerTokensTypeDropdownConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  padding: string,
  gap: string,
  maxHeight: string,
  column: timePickerTimePickerTokensTypeDropdownColumnConfig,
  option: timePickerTimePickerTokensTypeDropdownOptionConfig,
}
type timePickerTimePickerTokensTypeErrorMessageConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  marginTop: string,
}
type timePickerTokensType = {
  dropdown: timePickerTimePickerTokensTypeDropdownConfig,
  errorMessage: timePickerTimePickerTokensTypeErrorMessageConfig,
}
type responsiveTimePickerTokens = {
  sm: timePickerTokensType,
  lg: timePickerTokensType,
}
type timePickerProps = {
  value?: SharedTypes.timeValue,
  onChange?: SharedTypes.timeValue => unit,
  format?: SharedTypes.timeFormat,
  showSeconds?: bool,
  minuteStep?: float,
  minTime?: SharedTypes.timeValue,
  maxTime?: SharedTypes.timeValue,
  disabled?: bool,
  error?: bool,
  errorMessage?: string,
  size?: timePickerSize,
  placeholder?: string,
  name?: string,
  @as("aria-label") ariaLabel?: string,
}
