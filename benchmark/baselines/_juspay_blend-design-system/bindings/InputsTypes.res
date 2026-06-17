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
type inputsPlaceholderConfig = {
  color: string,
  fontWeight: string,
}
type inputsColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: inputsColorConfig,
}
type inputsHelpIconConfig = {
  width: string,
  color: inputsColorConfig,
}
type inputsErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type inputsRequiredConfig = {
  color: string,
}
type inputsFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsPaddingConfig = {
  x: inputsFontSizeConfig,
  y: inputsFontSizeConfig,
}
type inputsInputContainerConfig = {
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  color: inputsColorConfig,
  borderRadius: inputsFontSizeConfig,
  boxShadow: string,
  padding: inputsPaddingConfig,
  border: inputsColorConfig,
  backgroundColor: inputsColorConfig,
}
type textInputTokensType = {
  placeholder: inputsPlaceholderConfig,
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  hintText: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig,
}
type responsiveTextInputTokens = {
  sm: textInputTokensType,
  lg: textInputTokensType,
}
type inputsColorConfig2 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsWidthConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsIconConfig = {
  color: inputsColorConfig2,
  width: inputsWidthConfig,
}
type inputsStepperButtonConfig = {
  width: inputsFontSizeConfig,
  backgroundColor: inputsColorConfig,
  icon: inputsIconConfig,
}
type inputsInputContainerConfig2 = {
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  color: inputsColorConfig,
  borderRadius: inputsFontSizeConfig,
  boxShadow: string,
  padding: inputsPaddingConfig,
  border: inputsColorConfig,
  backgroundColor: inputsColorConfig,
  stepperButton: inputsStepperButtonConfig,
}
type numberInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  hintText: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig2,
}
type responsiveNumberInputTokens = {
  sm: numberInputTokensType,
  lg: numberInputTokensType,
}
type inputsInputContainerConfig3 = {
  gap: string,
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  color: inputsColorConfig,
  borderRadius?: inputsFontSizeConfig,
  boxShadow: string,
  padding: inputsPaddingConfig,
  border: inputsColorConfig,
  backgroundColor: inputsColorConfig,
}
type dropdownInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  hintText: inputsLabelConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  helpIcon: inputsHelpIconConfig,
  inputContainer: inputsInputContainerConfig3,
}
type responsiveDropdownInputTokens = {
  sm: dropdownInputTokensType,
  lg: dropdownInputTokensType,
}
type inputsPaddingConfig2 = {
  x: string,
  y: string,
}
type inputsInputContainerConfig4 = {
  padding: inputsPaddingConfig2,
  borderRadius: string,
  borderBottom: inputsColorConfig,
  outline: string,
  boxShadow: string,
  color: inputsColorConfig,
  fontSize: string,
  fontWeight: string,
}
type inputsIconConfig2 = {
  color: inputsColorConfig,
  width: string,
}
type searchInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  hintText: inputsLabelConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig4,
  icon: inputsIconConfig2,
}
type responsiveSearchInputTokens = {
  sm: searchInputTokensType,
  lg: searchInputTokensType,
}
type inputsInputConfig = {
  height: string,
  width: string,
  fontSize: string,
  fontWeight: string,
  color: inputsColorConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsColorConfig,
  backgroundColor: inputsColorConfig,
}
type inputsInputContainerConfig5 = {
  gap: string,
  input: inputsInputConfig,
}
type otpInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  hintText: inputsLabelConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig5,
}
type responsiveOTPInputTokens = {
  sm: otpInputTokensType,
  lg: otpInputTokensType,
}
type inputsUnitConfig = {
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  color: inputsColorConfig,
  padding: inputsFontSizeConfig,
  backgroundColor: inputsColorConfig,
}
type inputsInputContainerConfig6 = {
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  color: inputsColorConfig,
  borderRadius: inputsFontSizeConfig,
  boxShadow: string,
  padding: inputsPaddingConfig,
  border: inputsColorConfig,
  backgroundColor: inputsColorConfig,
  unit: inputsUnitConfig,
}
type unitInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  hintText: inputsLabelConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig6,
}
type responsiveUnitInputTokens = {
  sm: unitInputTokensType,
  lg: unitInputTokensType,
}
type inputsInputContainerConfig7 = {
  fontSize: inputsFontSizeConfig,
  fontWeight: inputsFontSizeConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: inputsColorConfig,
  padding: inputsPaddingConfig,
  border: inputsColorConfig,
  color: inputsColorConfig,
  backgroundColor: inputsColorConfig,
}
type multiValueInputTokensType = {
  gap: string,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  hintText: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig7,
}
type responsiveMultiValueInputTokens = {
  sm: multiValueInputTokensType,
  lg: multiValueInputTokensType,
}
type inputsPlaceholderConfig2 = {
  color?: string,
  fontWeight?: string,
}
type inputsInputContainerConfig8 = {
  fontSize: string,
  fontWeight: string,
  padding: inputsPaddingConfig2,
  borderRadius: string,
  boxShadow: string,
  border: inputsColorConfig,
  color: inputsColorConfig,
  backgroundColor: inputsColorConfig,
}
type textAreaTokensType = {
  gap: string,
  placeholder?: inputsPlaceholderConfig2,
  label: inputsLabelConfig,
  subLabel: inputsLabelConfig,
  helpIcon: inputsHelpIconConfig,
  hintText: inputsLabelConfig,
  errorMessage: inputsErrorMessageConfig,
  required: inputsRequiredConfig,
  inputContainer: inputsInputContainerConfig8,
}
type responsiveTextAreaTokens = {
  sm: textAreaTokensType,
  lg: textAreaTokensType,
}
