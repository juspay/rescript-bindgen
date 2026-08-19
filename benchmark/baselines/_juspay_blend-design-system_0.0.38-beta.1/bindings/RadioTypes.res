type radioSize =
  | @as("sm") Sm
  | @as("md") Md
type radioResponsiveRadioTokensSmGroupConfig = {
  gap: string,
}
type radioResponsiveRadioTokensSmIndicatorActiveConfig = {
  backgroundColor: string,  // ⚪ loose — was `{ disabled: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; error: BackgroundColor; }`
  borderColor: string,  // ⚪ loose — was `{ disabled: BorderColor; default: BorderColor; hover: BorderColor; error: BorderColor; }`
}
type radioResponsiveRadioTokensSmIndicatorConfig = {
  active: radioResponsiveRadioTokensSmIndicatorActiveConfig,
  inactive: radioResponsiveRadioTokensSmIndicatorActiveConfig,
}
type radioResponsiveRadioTokensSmActiveIndicatorActiveConfig = {
  backgroundColor: string,  // ⚪ loose — was `{ disabled: BackgroundColor; default: BackgroundColor; }`
}
type radioResponsiveRadioTokensSmActiveIndicatorConfig = {
  active: radioResponsiveRadioTokensSmActiveIndicatorActiveConfig,
}
type radioResponsiveRadioTokensSmContentLabelConfig = {
  gap: string,
  color: string,  // ⚪ loose — was `{ disabled: Color; default: Color; hover: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
}
type radioResponsiveRadioTokensSmContentSublabelConfig = {
  color: string,  // ⚪ loose — was `{ disabled: Color; default: Color; hover: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
}
type radioResponsiveRadioTokensSmContentConfig = {
  label: radioResponsiveRadioTokensSmContentLabelConfig,
  sublabel: radioResponsiveRadioTokensSmContentSublabelConfig,
}
type radioResponsiveRadioTokensSmHeightConfig = {
  sm: string,
  md: string,
}
type radioResponsiveRadioTokensSmBorderWidthActiveConfig = {
  disabled: float,
  default: float,
  hover: float,
  error: float,
}
type radioResponsiveRadioTokensSmBorderWidthConfig = {
  active: radioResponsiveRadioTokensSmBorderWidthActiveConfig,
  inactive: radioResponsiveRadioTokensSmBorderWidthActiveConfig,
}
type radioResponsiveRadioTokensSmRequiredConfig = {
  color: string,
}
type radioResponsiveRadioTokensSmConfig = {
  gap: string,
  group: radioResponsiveRadioTokensSmGroupConfig,
  indicator: radioResponsiveRadioTokensSmIndicatorConfig,
  activeIndicator: radioResponsiveRadioTokensSmActiveIndicatorConfig,
  content: radioResponsiveRadioTokensSmContentConfig,
  height: radioResponsiveRadioTokensSmHeightConfig,
  borderWidth: radioResponsiveRadioTokensSmBorderWidthConfig,
  slot: radioResponsiveRadioTokensSmHeightConfig,
  required: radioResponsiveRadioTokensSmRequiredConfig,
}
type responsiveRadioTokens = {
  sm: radioResponsiveRadioTokensSmConfig,
  lg: radioResponsiveRadioTokensSmConfig,
}
type radioMaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type radioGroupProps = {
  id?: string,
  label?: string,
  name: string,
  defaultValue?: string,
  value?: string,
  children: React.element,
  onChange?: string => unit,
  disabled?: bool,
  required?: bool,
  error?: bool,
}
