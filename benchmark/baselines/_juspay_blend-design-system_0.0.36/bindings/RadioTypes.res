type radioSize =
  | @as("sm") Sm
  | @as("md") Md
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
type radioResponsiveRadioTokensSmGroupConfig = {
  gap: string,
}
type radioResponsiveRadioTokensSmIndicatorActiveBackgroundColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type radioResponsiveRadioTokensSmIndicatorActiveConfig = {
  backgroundColor: radioResponsiveRadioTokensSmIndicatorActiveBackgroundColorConfig,
  borderColor: radioResponsiveRadioTokensSmIndicatorActiveBackgroundColorConfig,
}
type radioResponsiveRadioTokensSmIndicatorConfig = {
  active: radioResponsiveRadioTokensSmIndicatorActiveConfig,
  inactive: radioResponsiveRadioTokensSmIndicatorActiveConfig,
}
type radioResponsiveRadioTokensSmActiveIndicatorActiveBackgroundColorConfig = {
  disabled: string,
  default: string,
}
type radioResponsiveRadioTokensSmActiveIndicatorActiveConfig = {
  backgroundColor: radioResponsiveRadioTokensSmActiveIndicatorActiveBackgroundColorConfig,
}
type radioResponsiveRadioTokensSmActiveIndicatorConfig = {
  active: radioResponsiveRadioTokensSmActiveIndicatorActiveConfig,
}
type radioResponsiveRadioTokensSmContentLabelFontSizeConfig = {
  sm: string,
  md: string,
}
type radioResponsiveRadioTokensSmContentLabelConfig = {
  gap: string,
  color: radioResponsiveRadioTokensSmIndicatorActiveBackgroundColorConfig,
  fontSize: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
  fontWeight: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
}
type radioResponsiveRadioTokensSmContentSublabelConfig = {
  color: radioResponsiveRadioTokensSmIndicatorActiveBackgroundColorConfig,
  fontSize: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
  fontWeight: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
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
  height: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
  borderWidth: radioResponsiveRadioTokensSmBorderWidthConfig,
  slot: radioResponsiveRadioTokensSmContentLabelFontSizeConfig,
  required: radioResponsiveRadioTokensSmRequiredConfig,
}
type responsiveRadioTokens = {
  sm: radioResponsiveRadioTokensSmConfig,
  lg: radioResponsiveRadioTokensSmConfig,
}
