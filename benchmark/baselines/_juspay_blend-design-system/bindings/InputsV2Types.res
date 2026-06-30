type inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsV2TextInputV2TokensTypeTopContainerLabelConfig = {
  fontSize: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  fontWeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  lineHeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  color: inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig,
}
type inputsV2TextInputV2TokensTypeTopContainerRequiredConfig = {
  color: string,
}
type inputsV2TextInputV2TokensTypeTopContainerHelpIconConfig = {
  width: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  color: inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig,
}
type inputsV2TextInputV2TokensTypeTopContainerConfig = {
  label: inputsV2TextInputV2TokensTypeTopContainerLabelConfig,
  subLabel: inputsV2TextInputV2TokensTypeTopContainerLabelConfig,
  required: inputsV2TextInputV2TokensTypeTopContainerRequiredConfig,
  helpIcon: inputsV2TextInputV2TokensTypeTopContainerHelpIconConfig,
}
type inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig = {
  color: inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig,
  fontSize: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  fontWeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  lineHeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
}
type inputsV2TextInputV2TokensTypeInputContainerPaddingConfig = {
  top: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  right: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  bottom: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  left: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
}
type inputsV2TextInputV2TokensTypeInputContainerConfig = {
  gap: string,
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  inputText: inputsV2TextInputV2TokensTypeTopContainerLabelConfig,
  borderRadius: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  boxShadow: string,
  padding: inputsV2TextInputV2TokensTypeInputContainerPaddingConfig,
  border: inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig,
  backgroundColor: inputsV2TextInputV2TokensTypeTopContainerLabelColorConfig,
}
type inputsV2TextInputV2TokensTypeBottomContainerErrorMessageConfig = {
  fontSize: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  fontWeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  lineHeight: inputsV2TextInputV2TokensTypeTopContainerLabelFontSizeConfig,
  color: string,
}
type inputsV2TextInputV2TokensTypeBottomContainerConfig = {
  hintText: inputsV2TextInputV2TokensTypeTopContainerLabelConfig,
  errorMessage: inputsV2TextInputV2TokensTypeBottomContainerErrorMessageConfig,
}
type textInputV2TokensType = {
  gap: string,
  topContainer: inputsV2TextInputV2TokensTypeTopContainerConfig,
  inputContainer: inputsV2TextInputV2TokensTypeInputContainerConfig,
  bottomContainer: inputsV2TextInputV2TokensTypeBottomContainerConfig,
}
type responsiveTextInputV2Tokens = {
  sm: textInputV2TokensType,
  lg: textInputV2TokensType,
}
