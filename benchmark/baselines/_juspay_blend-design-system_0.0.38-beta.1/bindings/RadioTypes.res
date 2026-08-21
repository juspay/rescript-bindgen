type radioSize =
  | @as("sm") Sm
  | @as("md") Md
type radioResponsiveRadioTokensSmGroupConfig = {
  gap: string,
}
type radioUseThemeBackgroundColorConfigV2arva = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type radioResponsiveRadioTokensSmIndicatorActiveConfig = {
  backgroundColor: radioUseThemeBackgroundColorConfigV2arva,
  borderColor: radioUseThemeBackgroundColorConfigV2arva,
}
type radioResponsiveRadioTokensSmIndicatorConfig = {
  active: radioResponsiveRadioTokensSmIndicatorActiveConfig,
  inactive: radioResponsiveRadioTokensSmIndicatorActiveConfig,
}
type radioUseThemeBackgroundColorConfigQe6zv = {
  disabled: string,
  default: string,
}
type radioResponsiveRadioTokensSmActiveIndicatorActiveConfig = {
  backgroundColor: radioUseThemeBackgroundColorConfigQe6zv,
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
type radioResponsiveRadioTokensSmHeightConfig = {
  sm: string,
  md: string,
}
type radioResponsiveRadioTokensSmContentSublabelConfig = {
  color: radioUseThemeBackgroundColorConfigV2arva,
  fontSize: radioResponsiveRadioTokensSmHeightConfig,
  fontWeight: radioResponsiveRadioTokensSmHeightConfig,
}
type radioResponsiveRadioTokensSmContentConfig = {
  label: radioResponsiveRadioTokensSmContentLabelConfig,
  sublabel: radioResponsiveRadioTokensSmContentSublabelConfig,
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
