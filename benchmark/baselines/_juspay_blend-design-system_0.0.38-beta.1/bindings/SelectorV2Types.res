type selectorV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type selectorV2GetCheckboxLabelStylesCursor =
  | @as("not-allowed") NotAllowed
  | @as("pointer") Pointer
type checkboxV2CheckedState =
  | @as("checked") Checked
  | @as("unchecked") Unchecked
  | @as("indeterminate") Indeterminate
type selectorV2SwitchV2TokensTypeSwitchHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type selectorV2UseThemeCheckedConfigV1jmxk = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig = {
  checked: selectorV2UseThemeCheckedConfigV1jmxk,
  unchecked: selectorV2UseThemeCheckedConfigV1jmxk,
}
type selectorV2SwitchV2TokensTypeSwitchThumbConfig = {
  backgroundColor: string,
  border: string,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  outline: string,
}
type selectorV2SwitchV2TokensTypeSwitchConfig = {
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  backgroundColor: selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig,
  thumb: selectorV2SwitchV2TokensTypeSwitchThumbConfig,
}
type selectorV2UseThemeSlotConfig = {
  maxHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
}
type selectorV2SwitchV2TokensTypeContentLabelConfig = {
  gap: string,
  color: selectorV2UseThemeCheckedConfigV1jmxk,
  fontSize: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  fontWeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  lineHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  slot: selectorV2UseThemeSlotConfig,
}
type selectorV2SwitchV2TokensTypeContentSubLabelConfig = {
  color: selectorV2UseThemeCheckedConfigV1jmxk,
  fontSize: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  fontWeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  lineHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
}
type selectorV2SwitchV2TokensTypeContentRequiredConfig = {
  color: string,
}
type selectorV2SwitchV2TokensTypeContentConfig = {
  gap: string,
  label: selectorV2SwitchV2TokensTypeContentLabelConfig,
  subLabel: selectorV2SwitchV2TokensTypeContentSubLabelConfig,
  required: selectorV2SwitchV2TokensTypeContentRequiredConfig,
}
type switchV2TokensType = {
  gap: string,
  @as("switch") switch_: selectorV2SwitchV2TokensTypeSwitchConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveSwitchV2Tokens = {
  sm: switchV2TokensType,
  lg: switchV2TokensType,
}
type selectorV2UseThemeCheckedConfigV1xn0i = {
  default?: string,
  hover?: string,
  focus?: string,
  error?: string,
  disabled?: string,
}
type selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig = {
  checked?: selectorV2UseThemeCheckedConfigV1xn0i,
  unchecked?: selectorV2UseThemeCheckedConfigV1xn0i,
  indeterminate?: selectorV2UseThemeCheckedConfigV1xn0i,
}
type selectorV2UseThemeColorCheckedConfig = {
  default?: string,
  disabled?: string,
}
type selectorV2UseThemeColorConfig = {
  checked?: selectorV2UseThemeColorCheckedConfig,
  unchecked?: selectorV2UseThemeColorCheckedConfig,
  indeterminate?: selectorV2UseThemeColorCheckedConfig,
}
type selectorV2CheckboxV2TokensTypeCheckboxIconConfig = {
  color: selectorV2UseThemeColorConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  strokeWidth: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
}
type selectorV2CheckboxV2TokensTypeCheckboxConfig = {
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  opacity: string,
  backgroundColor: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig,
  borderRadius: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  border: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: selectorV2CheckboxV2TokensTypeCheckboxIconConfig,
}
type checkboxV2TokensType = {
  gap: string,
  checkbox: selectorV2CheckboxV2TokensTypeCheckboxConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveCheckboxV2Tokens = {
  sm: checkboxV2TokensType,
  lg: checkboxV2TokensType,
}
type selectorV2RadioV2TokensTypeGroupConfig = {
  gap: string,
}
type selectorV2UseThemeActiveConfigV1d7w8 = {
  backgroundColor: selectorV2UseThemeCheckedConfigV1jmxk,
  borderColor: selectorV2UseThemeCheckedConfigV1jmxk,
}
type selectorV2RadioV2TokensTypeRadioIndicatorConfig = {
  active: selectorV2UseThemeActiveConfigV1d7w8,
  inactive: selectorV2UseThemeActiveConfigV1d7w8,
}
type selectorV2UseThemeActiveBackgroundColorConfig = {
  default: string,
  focus: string,
  disabled: string,
}
type selectorV2UseThemeActiveConfigV1udim = {
  backgroundColor: selectorV2UseThemeActiveBackgroundColorConfig,
}
type selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig = {
  active: selectorV2UseThemeActiveConfigV1udim,
}
type selectorV2RadioV2TokensTypeRadioConfig = {
  indicator: selectorV2RadioV2TokensTypeRadioIndicatorConfig,
  activeIndicator: selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  borderWidth: selectorV2RadioV2TokensTypeRadioIndicatorConfig,
}
type radioV2TokensType = {
  gap: string,
  group: selectorV2RadioV2TokensTypeGroupConfig,
  radio: selectorV2RadioV2TokensTypeRadioConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveRadioV2Tokens = {
  sm: radioV2TokensType,
  lg: radioV2TokensType,
}
type selectorV2SlotConfig = {
  slot: React.element,
  maxHeight?: string,
}
type selectorV2MaxLengthConfig = {
  label?: float,
  subLabel?: float,
}
type selectorV2GetCheckboxTextPropsConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type selectorV2GetCheckboxSubtextPropsConfig = {
  fontSize: string,
  color: string,
}
type selectorV2GetCheckboxLabelStylesConfig = {
  cursor: selectorV2GetCheckboxLabelStylesCursor,
  display: [#"flex"],
  alignItems: [#"center"],
  margin: float,
  padding: float,
}
type selectorV2GetAccessibilityAttributesConfig = {
  role: string,
  @as("aria-checked") ariaChecked?: string,
  @as("aria-labelledby") ariaLabelledby: string,
  @as("aria-describedby") ariaDescribedby: string,
}
