type textInputSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type inputsCursor =
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
type inputsResize =
  | @as("none") None
  | @as("block") Block
  | @as("inline") Inline
  | @as("both") Both
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type inputsSearchInputTokensTypeLabelColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsSearchInputTokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: inputsSearchInputTokensTypeLabelColorConfig,
}
type inputsSearchInputTokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type inputsSearchInputTokensTypeRequiredConfig = {
  color: string,
}
type inputsSearchInputTokensTypeInputContainerPaddingConfig = {
  x: string,
  y: string,
}
type inputsSearchInputTokensTypeInputContainerConfig = {
  padding: inputsSearchInputTokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  borderBottom: inputsSearchInputTokensTypeLabelColorConfig,
  outline: string,
  boxShadow: string,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  fontSize: string,
  fontWeight: string,
}
type inputsSearchInputTokensTypeIconConfig = {
  color: inputsSearchInputTokensTypeLabelColorConfig,
  width: string,
}
type searchInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsSearchInputTokensTypeInputContainerConfig,
  icon: inputsSearchInputTokensTypeIconConfig,
}
type responsiveSearchInputTokens = {
  sm: searchInputTokensType,
  lg: searchInputTokensType,
}
type inputsTextAreaTokensTypePlaceholderConfig = {
  color?: string,
  fontWeight?: string,
}
type inputsTextAreaTokensTypeHelpIconConfig = {
  width: string,
  color: inputsSearchInputTokensTypeLabelColorConfig,
}
type inputsTextAreaTokensTypeInputContainerConfig = {
  fontSize: string,
  fontWeight: string,
  padding: inputsSearchInputTokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type textAreaTokensType = {
  gap: string,
  placeholder?: inputsTextAreaTokensTypePlaceholderConfig,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsTextAreaTokensTypeInputContainerConfig,
}
type responsiveTextAreaTokens = {
  sm: textAreaTokensType,
  lg: textAreaTokensType,
}
type inputsTextInputTokensTypePlaceholderConfig = {
  color: string,
  fontWeight: string,
}
type inputsTextInputTokensTypeInputContainerFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsTextInputTokensTypeInputContainerPaddingConfig = {
  x: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  y: inputsTextInputTokensTypeInputContainerFontSizeConfig,
}
type inputsTextInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type textInputTokensType = {
  placeholder: inputsTextInputTokensTypePlaceholderConfig,
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsTextInputTokensTypeInputContainerConfig,
}
type responsiveTextInputTokens = {
  sm: textInputTokensType,
  lg: textInputTokensType,
}
type inputsNumberInputTokensTypeInputContainerStepperButtonIconConfig = {
  color: inputsSearchInputTokensTypeLabelColorConfig,
  width: inputsTextInputTokensTypeInputContainerFontSizeConfig,
}
type inputsNumberInputTokensTypeInputContainerStepperButtonConfig = {
  width: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
  icon: inputsNumberInputTokensTypeInputContainerStepperButtonIconConfig,
}
type inputsNumberInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
  stepperButton: inputsNumberInputTokensTypeInputContainerStepperButtonConfig,
}
type numberInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsNumberInputTokensTypeInputContainerConfig,
}
type responsiveNumberInputTokens = {
  sm: numberInputTokensType,
  lg: numberInputTokensType,
}
type inputsOTPInputTokensTypeInputContainerInputConfig = {
  height: string,
  width: string,
  fontSize: string,
  fontWeight: string,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type inputsOTPInputTokensTypeInputContainerConfig = {
  gap: string,
  input: inputsOTPInputTokensTypeInputContainerInputConfig,
}
type otpInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsOTPInputTokensTypeInputContainerConfig,
}
type responsiveOTPInputTokens = {
  sm: otpInputTokensType,
  lg: otpInputTokensType,
}
type inputsUnitInputTokensTypeInputContainerUnitConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  padding: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type inputsUnitInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
  unit: inputsUnitInputTokensTypeInputContainerUnitConfig,
}
type unitInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsUnitInputTokensTypeInputContainerConfig,
}
type responsiveUnitInputTokens = {
  sm: unitInputTokensType,
  lg: unitInputTokensType,
}
type inputsMultiValueInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: inputsSearchInputTokensTypeLabelColorConfig,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type multiValueInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  inputContainer: inputsMultiValueInputTokensTypeInputContainerConfig,
}
type responsiveMultiValueInputTokens = {
  sm: multiValueInputTokensType,
  lg: multiValueInputTokensType,
}
type inputsDropdownInputTokensTypeInputContainerConfig = {
  gap: string,
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsSearchInputTokensTypeLabelColorConfig,
  borderRadius?: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsSearchInputTokensTypeLabelColorConfig,
  backgroundColor: inputsSearchInputTokensTypeLabelColorConfig,
}
type dropdownInputTokensType = {
  gap: string,
  label: inputsSearchInputTokensTypeLabelConfig,
  subLabel: inputsSearchInputTokensTypeLabelConfig,
  hintText: inputsSearchInputTokensTypeLabelConfig,
  errorMessage: inputsSearchInputTokensTypeErrorMessageConfig,
  required: inputsSearchInputTokensTypeRequiredConfig,
  helpIcon: inputsTextAreaTokensTypeHelpIconConfig,
  inputContainer: inputsDropdownInputTokensTypeInputContainerConfig,
}
type responsiveDropdownInputTokens = {
  sm: dropdownInputTokensType,
  lg: dropdownInputTokensType,
}
