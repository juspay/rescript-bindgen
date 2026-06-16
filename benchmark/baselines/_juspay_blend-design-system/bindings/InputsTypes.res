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
type errorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type requiredConfig = {
  color: string,
}
type fontSizeConfig5 = {
  sm: string,
  md: string,
  lg: string,
}
type paddingConfig14 = {
  x: fontSizeConfig5,
  y: fontSizeConfig5,
}
type inputContainerConfig = {
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  color: colorConfig9,
  borderRadius: fontSizeConfig5,
  boxShadow: string,
  padding: paddingConfig14,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
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
  width: fontSizeConfig5,
  backgroundColor: colorConfig9,
  icon: iconConfig,
}
type inputContainerConfig2 = {
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  color: colorConfig9,
  borderRadius: fontSizeConfig5,
  boxShadow: string,
  padding: paddingConfig14,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  inputContainer: inputContainerConfig2,
}
type responsiveNumberInputTokens = {
  sm: numberInputTokensType,
  lg: numberInputTokensType,
}
type inputContainerConfig3 = {
  gap: string,
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  color: colorConfig9,
  borderRadius?: fontSizeConfig5,
  boxShadow: string,
  padding: paddingConfig14,
  border: colorConfig9,
  backgroundColor: colorConfig9,
}
type dropdownInputTokensType = {
  gap: string,
  label: labelConfig2,
  subLabel: labelConfig2,
  hintText: labelConfig2,
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  helpIcon: helpIconConfig2,
  inputContainer: inputContainerConfig3,
}
type responsiveDropdownInputTokens = {
  sm: dropdownInputTokensType,
  lg: dropdownInputTokensType,
}
type paddingConfig15 = {
  x: string,
  y: string,
}
type inputContainerConfig4 = {
  padding: paddingConfig15,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  inputContainer: inputContainerConfig5,
}
type responsiveOTPInputTokens = {
  sm: otpInputTokensType,
  lg: otpInputTokensType,
}
type unitConfig2 = {
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  color: colorConfig9,
  padding: fontSizeConfig5,
  backgroundColor: colorConfig9,
}
type inputContainerConfig6 = {
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  color: colorConfig9,
  borderRadius: fontSizeConfig5,
  boxShadow: string,
  padding: paddingConfig14,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  inputContainer: inputContainerConfig6,
}
type responsiveUnitInputTokens = {
  sm: unitInputTokensType,
  lg: unitInputTokensType,
}
type inputContainerConfig7 = {
  fontSize: fontSizeConfig5,
  fontWeight: fontSizeConfig5,
  gap: string,
  borderRadius?: string,
  boxShadow: colorConfig9,
  padding: paddingConfig14,
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
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  inputContainer: inputContainerConfig7,
}
type responsiveMultiValueInputTokens = {
  sm: multiValueInputTokensType,
  lg: multiValueInputTokensType,
}
type placeholderConfig5 = {
  color?: string,
  fontWeight?: string,
}
type inputContainerConfig8 = {
  fontSize: string,
  fontWeight: string,
  padding: paddingConfig15,
  borderRadius: string,
  boxShadow: string,
  border: colorConfig9,
  color: colorConfig9,
  backgroundColor: colorConfig9,
}
type textAreaTokensType = {
  gap: string,
  placeholder?: placeholderConfig5,
  label: labelConfig2,
  subLabel: labelConfig2,
  helpIcon: helpIconConfig2,
  hintText: labelConfig2,
  errorMessage: errorMessageConfig,
  required: requiredConfig,
  inputContainer: inputContainerConfig8,
}
type responsiveTextAreaTokens = {
  sm: textAreaTokensType,
  lg: textAreaTokensType,
}
