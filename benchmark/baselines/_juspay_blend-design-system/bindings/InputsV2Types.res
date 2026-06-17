type inputsV2FontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsV2ColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsV2LabelConfig = {
  fontSize: inputsV2FontSizeConfig,
  fontWeight: inputsV2FontSizeConfig,
  lineHeight: inputsV2FontSizeConfig,
  color: inputsV2ColorConfig,
}
type inputsV2RequiredConfig = {
  color?: string,
}
type inputsV2HelpIconConfig = {
  width: inputsV2FontSizeConfig,
  color: inputsV2ColorConfig,
}
type inputsV2TopContainerConfig = {
  label: inputsV2LabelConfig,
  subLabel: inputsV2LabelConfig,
  required: inputsV2RequiredConfig,
  helpIcon: inputsV2HelpIconConfig,
}
type inputsV2PlaceholderConfig = {
  color: inputsV2ColorConfig,
  fontSize: inputsV2FontSizeConfig,
  fontWeight: inputsV2FontSizeConfig,
  lineHeight: inputsV2FontSizeConfig,
}
type inputsV2PaddingConfig = {
  top: inputsV2FontSizeConfig,
  right: inputsV2FontSizeConfig,
  bottom: inputsV2FontSizeConfig,
  left: inputsV2FontSizeConfig,
}
type inputsV2InputContainerConfig = {
  gap?: string,
  placeholder: inputsV2PlaceholderConfig,
  inputText: inputsV2LabelConfig,
  borderRadius: inputsV2FontSizeConfig,
  boxShadow?: string,
  padding: inputsV2PaddingConfig,
  border: inputsV2ColorConfig,
  backgroundColor: inputsV2ColorConfig,
}
type inputsV2ErrorMessageConfig = {
  fontSize: inputsV2FontSizeConfig,
  fontWeight: inputsV2FontSizeConfig,
  lineHeight: inputsV2FontSizeConfig,
  color?: string,
}
type inputsV2BottomContainerConfig = {
  hintText: inputsV2LabelConfig,
  errorMessage: inputsV2ErrorMessageConfig,
}
type textInputV2TokensType = {
  gap?: string,
  topContainer: inputsV2TopContainerConfig,
  inputContainer: inputsV2InputContainerConfig,
  bottomContainer: inputsV2BottomContainerConfig,
}
type responsiveTextInputV2Tokens = {
  sm: textInputV2TokensType,
  lg: textInputV2TokensType,
}
