type checkboxSize =
  | @as("sm") Sm
  | @as("md") Md
type checkboxCheckboxTokensTypeSlotConfig = {
  marginLeft: string,
}
type checkboxCheckboxTokensTypeIndicatorWidthConfig = {
  sm: string,
  md: string,
}
type checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig = {
  checked?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; disabled?: BackgroundColor; error?: BackgroundColor; }`
  unchecked?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; disabled?: BackgroundColor; error?: BackgroundColor; }`
  indeterminate?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; disabled?: BackgroundColor; error?: BackgroundColor; }`
}
type checkboxCheckboxTokensTypeIndicatorIconConfig = {
  color: string,  // ⚪ loose — was `{ checked?: { default?: Color; disabled?: Color; }; unchecked?: { default?: Color; disabled?: Color; }; indete`
  width: string,  // ⚪ loose — was `{ sm: Width<number | (string & {})>; md: Width<number | (string & {})>; }`
  height: string,  // ⚪ loose — was `{ sm: Height<number | (string & {})>; md: Height<number | (string & {})>; }`
  strokeWidth: string,  // ⚪ loose — was `{ sm: StrokeWidth<number | (string & {})>; md: StrokeWidth<number | (string & {})>; }`
}
type checkboxCheckboxTokensTypeIndicatorConfig = {
  width: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  height: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  backgroundColor: checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig,
  borderRadius: checkboxCheckboxTokensTypeIndicatorWidthConfig,
  border: checkboxCheckboxTokensTypeIndicatorBackgroundColorConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: checkboxCheckboxTokensTypeIndicatorIconConfig,
}
type checkboxCheckboxTokensTypeContentLabelConfig = {
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; disabled: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
  lineHeight: string,  // ⚪ loose — was `{ sm: LineHeight<number | (string & {})>; md: LineHeight<number | (string & {})>; }`
}
type checkboxCheckboxTokensTypeContentSubtextConfig = {
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; disabled: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
}
type checkboxCheckboxTokensTypeContentConfig = {
  gap: string,
  label: checkboxCheckboxTokensTypeContentLabelConfig,
  subtext: checkboxCheckboxTokensTypeContentSubtextConfig,
}
type checkboxCheckboxTokensTypeRequiredConfig = {
  color: string,
}
type checkboxTokensType = {
  gap: string,
  slot: checkboxCheckboxTokensTypeSlotConfig,
  indicator: checkboxCheckboxTokensTypeIndicatorConfig,
  content: checkboxCheckboxTokensTypeContentConfig,
  required: checkboxCheckboxTokensTypeRequiredConfig,
}
type responsiveCheckboxTokens = {
  sm: checkboxTokensType,
  lg: checkboxTokensType,
}
type checkboxCheckboxPropsMaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type checkboxProps = {
  label?: string,
  id?: string,
  name?: string,
  checked?: CommonTypes.boolOrIndeterminate,
  defaultChecked?: bool,
  onCheckedChange?: CommonTypes.boolOrIndeterminate => unit,
  disabled?: bool,
  required?: bool,
  error?: bool,
  size?: checkboxSize,
  children?: React.element,
  subtext?: string,
  slot?: React.element,
  maxLength?: checkboxCheckboxPropsMaxLengthConfig,
}
