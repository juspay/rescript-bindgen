type backgroundColorConfig17 = {
  checked: InputsTypes.colorConfig9,
  unchecked: InputsTypes.colorConfig9,
}
type thumbConfig2 = {
  backgroundColor: string,
  border: string,
  width: ButtonSharedTypes.slotMaxHeightConfig,
  height: ButtonSharedTypes.slotMaxHeightConfig,
  outline: string,
}
type switch_Config = {
  height: ButtonSharedTypes.slotMaxHeightConfig,
  width: ButtonSharedTypes.slotMaxHeightConfig,
  backgroundColor: backgroundColorConfig17,
  thumb: thumbConfig2,
}
type slotConfig8 = {
  maxHeight: InputsTypes.widthConfig2,
}
type labelConfig9 = {
  gap: string,
  color: InputsTypes.colorConfig9,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  lineHeight: ButtonSharedTypes.slotMaxHeightConfig,
  slot: slotConfig8,
}
type subLabelConfig2 = {
  color: InputsTypes.colorConfig9,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  lineHeight: ButtonSharedTypes.slotMaxHeightConfig,
}
type contentConfig11 = {
  gap: string,
  label: labelConfig9,
  subLabel: subLabelConfig2,
  required: AvatarGroupTypes.textConfig7,
}
type switchV2TokensType = {
  gap: string,
  @as("switch") switch_: switch_Config,
  content: contentConfig11,
}
type responsiveSwitchV2Tokens = {
  sm: switchV2TokensType,
  lg: switchV2TokensType,
}
type checkedConfig3 = {
  default?: string,
  hover?: string,
  focus?: string,
  error?: string,
  disabled?: string,
}
type backgroundColorConfig19 = {
  checked?: checkedConfig3,
  unchecked?: checkedConfig3,
  indeterminate?: checkedConfig3,
}
type iconConfig8 = {
  color: CheckboxTypes.colorConfig15,
  width: ButtonSharedTypes.slotMaxHeightConfig,
  height: ButtonSharedTypes.slotMaxHeightConfig,
  strokeWidth: ButtonSharedTypes.slotMaxHeightConfig,
}
type checkboxConfig = {
  height: ButtonSharedTypes.slotMaxHeightConfig,
  width: ButtonSharedTypes.slotMaxHeightConfig,
  opacity: string,
  backgroundColor: backgroundColorConfig19,
  borderRadius: ButtonSharedTypes.slotMaxHeightConfig,
  border: backgroundColorConfig19,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: iconConfig8,
}
type checkboxV2TokensType = {
  gap: string,
  checkbox: checkboxConfig,
  content: contentConfig11,
}
type responsiveCheckboxV2Tokens = {
  sm: checkboxV2TokensType,
  lg: checkboxV2TokensType,
}
type activeConfig6 = {
  backgroundColor: InputsTypes.colorConfig10,
  borderColor: InputsTypes.colorConfig10,
}
type indicatorConfig5 = {
  active: activeConfig6,
  inactive: activeConfig6,
}
type backgroundColorConfig20 = {
  default: string,
  focus: string,
  disabled: string,
}
type activeConfig7 = {
  backgroundColor: backgroundColorConfig20,
}
type activeIndicatorConfig3 = {
  active: activeConfig7,
}
type activeConfig8 = {
  default: float,
  hover: float,
  focus: float,
  error: float,
  disabled: float,
}
type borderWidthConfig2 = {
  active: activeConfig8,
  inactive: activeConfig8,
}
type radioConfig = {
  indicator: indicatorConfig5,
  activeIndicator: activeIndicatorConfig3,
  height: ButtonSharedTypes.slotMaxHeightConfig,
  borderWidth: borderWidthConfig2,
}
type radioV2TokensType = {
  gap: string,
  group: ChartsTypes.slotsConfig,
  radio: radioConfig,
  content: contentConfig11,
}
type responsiveRadioV2Tokens = {
  sm: radioV2TokensType,
  lg: radioV2TokensType,
}
