type fontSizeConfig9 = {
  sm: string,
  md: string,
  lg: string,
}
type colorConfig22 = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type labelConfig15 = {
  fontSize: fontSizeConfig9,
  fontWeight: fontSizeConfig9,
  lineHeight: fontSizeConfig9,
  color: colorConfig22,
}
type requiredConfig11 = {
  color: string,
}
type helpIconConfig4 = {
  width: fontSizeConfig9,
  color: colorConfig22,
}
type topContainerConfig = {
  label: labelConfig15,
  subLabel: labelConfig15,
  required: requiredConfig11,
  helpIcon: helpIconConfig4,
}
type placeholderConfig8 = {
  color: colorConfig22,
  fontSize: fontSizeConfig9,
  fontWeight: fontSizeConfig9,
  lineHeight: fontSizeConfig9,
}
type paddingConfig28 = {
  top: fontSizeConfig9,
  right: fontSizeConfig9,
  bottom: fontSizeConfig9,
  left: fontSizeConfig9,
}
type inputContainerConfig9 = {
  gap: string,
  placeholder: placeholderConfig8,
  inputText: labelConfig15,
  borderRadius: fontSizeConfig9,
  boxShadow: string,
  padding: paddingConfig28,
  border: colorConfig22,
  backgroundColor: colorConfig22,
}
type errorMessageConfig6 = {
  fontSize: fontSizeConfig9,
  fontWeight: fontSizeConfig9,
  lineHeight: fontSizeConfig9,
  color: string,
}
type bottomContainerConfig = {
  hintText: labelConfig15,
  errorMessage: errorMessageConfig6,
}
type textInputV2TokensType = {
  gap: string,
  topContainer: topContainerConfig,
  inputContainer: inputContainerConfig9,
  bottomContainer: bottomContainerConfig,
}
type responsiveTextInputV2Tokens = {
  sm: textInputV2TokensType,
  lg: textInputV2TokensType,
}
