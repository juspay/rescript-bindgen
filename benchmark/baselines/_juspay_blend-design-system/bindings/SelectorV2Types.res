type selectorV2HeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type selectorV2CheckedConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type selectorV2BackgroundColorConfig = {
  checked: selectorV2CheckedConfig,
  unchecked: selectorV2CheckedConfig,
}
type selectorV2ThumbConfig = {
  backgroundColor: string,
  border: string,
  width: selectorV2HeightConfig,
  height: selectorV2HeightConfig,
  outline: string,
}
type selectorV2SwitchConfig = {
  height: selectorV2HeightConfig,
  width: selectorV2HeightConfig,
  backgroundColor: selectorV2BackgroundColorConfig,
  thumb: selectorV2ThumbConfig,
}
type selectorV2MaxHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type selectorV2SlotConfig = {
  maxHeight: selectorV2MaxHeightConfig,
}
type selectorV2LabelConfig = {
  gap: string,
  color: selectorV2CheckedConfig,
  fontSize: selectorV2HeightConfig,
  fontWeight: selectorV2HeightConfig,
  lineHeight: selectorV2HeightConfig,
  slot: selectorV2SlotConfig,
}
type selectorV2SubLabelConfig = {
  color: selectorV2CheckedConfig,
  fontSize: selectorV2HeightConfig,
  fontWeight: selectorV2HeightConfig,
  lineHeight: selectorV2HeightConfig,
}
type selectorV2RequiredConfig = {
  color: string,
}
type selectorV2ContentConfig = {
  gap: string,
  label: selectorV2LabelConfig,
  subLabel: selectorV2SubLabelConfig,
  required: selectorV2RequiredConfig,
}
type switchV2TokensType = {
  gap: string,
  @as("switch") switch_: selectorV2SwitchConfig,
  content: selectorV2ContentConfig,
}
type responsiveSwitchV2Tokens = {
  sm: switchV2TokensType,
  lg: switchV2TokensType,
}
type selectorV2CheckedConfig2 = {
  default?: string,
  hover?: string,
  focus?: string,
  error?: string,
  disabled?: string,
}
type selectorV2BackgroundColorConfig2 = {
  checked?: selectorV2CheckedConfig2,
  unchecked?: selectorV2CheckedConfig2,
  indeterminate?: selectorV2CheckedConfig2,
}
type selectorV2CheckedConfig3 = {
  default?: string,
  disabled?: string,
}
type selectorV2ColorConfig = {
  checked?: selectorV2CheckedConfig3,
  unchecked?: selectorV2CheckedConfig3,
  indeterminate?: selectorV2CheckedConfig3,
}
type selectorV2IconConfig = {
  color: selectorV2ColorConfig,
  width: selectorV2HeightConfig,
  height: selectorV2HeightConfig,
  strokeWidth: selectorV2HeightConfig,
}
type selectorV2CheckboxConfig = {
  height: selectorV2HeightConfig,
  width: selectorV2HeightConfig,
  opacity: string,
  backgroundColor: selectorV2BackgroundColorConfig2,
  borderRadius: selectorV2HeightConfig,
  border: selectorV2BackgroundColorConfig2,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: selectorV2IconConfig,
}
type checkboxV2TokensType = {
  gap: string,
  checkbox: selectorV2CheckboxConfig,
  content: selectorV2ContentConfig,
}
type responsiveCheckboxV2Tokens = {
  sm: checkboxV2TokensType,
  lg: checkboxV2TokensType,
}
type selectorV2GroupConfig = {
  gap: string,
}
type selectorV2BackgroundColorConfig3 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type selectorV2ActiveConfig = {
  backgroundColor: selectorV2BackgroundColorConfig3,
  borderColor: selectorV2BackgroundColorConfig3,
}
type selectorV2IndicatorConfig = {
  active: selectorV2ActiveConfig,
  inactive: selectorV2ActiveConfig,
}
type selectorV2BackgroundColorConfig4 = {
  default: string,
  focus: string,
  disabled: string,
}
type selectorV2ActiveConfig2 = {
  backgroundColor: selectorV2BackgroundColorConfig4,
}
type selectorV2ActiveIndicatorConfig = {
  active: selectorV2ActiveConfig2,
}
type selectorV2ActiveConfig3 = {
  default: float,
  hover: float,
  focus: float,
  error: float,
  disabled: float,
}
type selectorV2BorderWidthConfig = {
  active: selectorV2ActiveConfig3,
  inactive: selectorV2ActiveConfig3,
}
type selectorV2RadioConfig = {
  indicator: selectorV2IndicatorConfig,
  activeIndicator: selectorV2ActiveIndicatorConfig,
  height: selectorV2HeightConfig,
  borderWidth: selectorV2BorderWidthConfig,
}
type radioV2TokensType = {
  gap: string,
  group: selectorV2GroupConfig,
  radio: selectorV2RadioConfig,
  content: selectorV2ContentConfig,
}
type responsiveRadioV2Tokens = {
  sm: radioV2TokensType,
  lg: radioV2TokensType,
}
