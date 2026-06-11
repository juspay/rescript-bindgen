type textInputSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type cursor =
  | @as("text") Text
  | @as("default") Default
  | @as("not-allowed") NotAllowed
  | @as("pointer") Pointer
type textInputGroupPosition =
  | @as("center") Center
  | @as("left") Left
  | @as("right") Right
type numberInputSize =
  | @as("md") Md
  | @as("lg") Lg
type dropdownPosition =
  | @as("left") Left
  | @as("right") Right
type unitInputSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type unitPosition =
  | @as("left") Left
  | @as("right") Right
type resize =
  | @as("none") None
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
  | @as("block") Block
  | @as("inline") Inline
  | @as("both") Both
type placeholderConfig = {
  color: string,
  fontWeight: string,
}
type colorConfig9 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type labelConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig9,
}
type helpIconConfig2 = {
  width: string,
  color: colorConfig9,
}
type paddingConfig10 = {
  x: ButtonSharedTypes.slotMaxHeightConfig,
  y: ButtonSharedTypes.slotMaxHeightConfig,
}
type inputContainerConfig = {
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  color: colorConfig9,
  borderRadius: ButtonSharedTypes.slotMaxHeightConfig,
  boxShadow: string,
  padding: paddingConfig10,
  border: colorConfig9,
  backgroundColor: colorConfig9,
}
type textInputTokensType = {
  placeholder: placeholderConfig,
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  helpIcon: helpIconConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig,
}
type responsiveTextInputTokens = {
  sm: textInputTokensType,
  lg: textInputTokensType,
}
type colorConfig10 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type widthConfig2 = {
  sm: string,
  md: string,
  lg: string,
}
type iconConfig = {
  color: colorConfig10,
  width: widthConfig2,
}
type stepperButtonConfig = {
  width: ButtonSharedTypes.slotMaxHeightConfig,
  backgroundColor: colorConfig9,
  icon: iconConfig,
}
type inputContainerConfig2 = {
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  color: colorConfig9,
  borderRadius: ButtonSharedTypes.slotMaxHeightConfig,
  boxShadow: string,
  padding: paddingConfig10,
  border: colorConfig9,
  backgroundColor: colorConfig9,
  stepperButton: stepperButtonConfig,
}
type numberInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  helpIcon: helpIconConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig2,
}
type responsiveNumberInputTokens = {
  sm: numberInputTokensType,
  lg: numberInputTokensType,
}
type inputContainerConfig3 = {
  gap: string,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  color: colorConfig9,
  borderRadius?: ButtonSharedTypes.slotMaxHeightConfig,
  boxShadow: string,
  padding: paddingConfig10,
  border: colorConfig9,
  backgroundColor: colorConfig9,
}
type dropdownInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  helpIcon: helpIconConfig2,
  inputContainer: inputContainerConfig3,
}
type responsiveDropdownInputTokens = {
  sm: dropdownInputTokensType,
  lg: dropdownInputTokensType,
}
type inputContainerConfig4 = {
  padding: ModalTypes.paddingConfig5,
  borderRadius: string,
  borderBottom: colorConfig9,
  outline: string,
  boxShadow: string,
  color: colorConfig9,
  fontSize: string,
  fontWeight: string,
}
type iconConfig2 = {
  color: colorConfig9,
  width: string,
}
type searchInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig4,
  icon: iconConfig2,
}
type responsiveSearchInputTokens = {
  sm: searchInputTokensType,
  lg: searchInputTokensType,
}
type inputConfig = {
  height: string,
  width: string,
  fontSize: string,
  fontWeight: string,
  color: colorConfig9,
  borderRadius: string,
  boxShadow: string,
  border: colorConfig9,
  backgroundColor: colorConfig9,
}
type inputContainerConfig5 = {
  gap: string,
  input: inputConfig,
}
type otpInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  helpIcon: helpIconConfig2,
  hintText: labelConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig5,
}
type responsiveOTPInputTokens = {
  sm: otpInputTokensType,
  lg: otpInputTokensType,
}
type unitConfig2 = {
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  color: colorConfig9,
  padding: ButtonSharedTypes.slotMaxHeightConfig,
  backgroundColor: colorConfig9,
}
type inputContainerConfig6 = {
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  color: colorConfig9,
  borderRadius: ButtonSharedTypes.slotMaxHeightConfig,
  boxShadow: string,
  padding: paddingConfig10,
  border: colorConfig9,
  backgroundColor: colorConfig9,
  unit: unitConfig2,
}
type unitInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  helpIcon: helpIconConfig2,
  hintText: labelConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig6,
}
type responsiveUnitInputTokens = {
  sm: unitInputTokensType,
  lg: unitInputTokensType,
}
type inputContainerConfig7 = {
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: colorConfig9,
  padding: paddingConfig10,
  border: colorConfig9,
  color: colorConfig9,
  backgroundColor: colorConfig9,
}
type multiValueInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  helpIcon: helpIconConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig7,
}
type responsiveMultiValueInputTokens = {
  sm: multiValueInputTokensType,
  lg: multiValueInputTokensType,
}
type placeholderConfig2 = {
  color?: string,
  fontWeight?: string,
}
type inputContainerConfig8 = {
  fontSize: string,
  fontWeight: string,
  padding: ModalTypes.paddingConfig5,
  borderRadius: string,
  boxShadow: string,
  border: colorConfig9,
  color: colorConfig9,
  backgroundColor: colorConfig9,
}
type textAreaTokensType = {
  gap: string,
  placeholder?: placeholderConfig2,
  label: labelConfig2,
  subLabel: labelConfig2,
  helpIcon: helpIconConfig2,
  hintText: labelConfig2,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  inputContainer: inputContainerConfig8,
}
type responsiveTextAreaTokens = {
  sm: textAreaTokensType,
  lg: textAreaTokensType,
}
