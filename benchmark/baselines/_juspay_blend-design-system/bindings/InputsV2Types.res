type labelConfig10 = {
  fontSize: ButtonSkeletonTypes.slotMaxHeightConfig,
  fontWeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  lineHeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  color: InputsTypes.colorConfig9,
}
type helpIconConfig3 = {
  width: ButtonSkeletonTypes.slotMaxHeightConfig,
  color: InputsTypes.colorConfig9,
}
type topContainerConfig = {
  label: labelConfig10,
  subLabel: labelConfig10,
  required: AvatarGroupTypes.textConfig7,
  helpIcon: helpIconConfig3,
}
type paddingConfig16 = {
  top: ButtonSkeletonTypes.slotMaxHeightConfig,
  right: ButtonSkeletonTypes.slotMaxHeightConfig,
  bottom: ButtonSkeletonTypes.slotMaxHeightConfig,
  left: ButtonSkeletonTypes.slotMaxHeightConfig,
}
type inputContainerConfig9 = {
  gap: string,
  placeholder: SelectorV2Types.subLabelConfig2,
  inputText: labelConfig10,
  borderRadius: ButtonSkeletonTypes.slotMaxHeightConfig,
  boxShadow: string,
  padding: paddingConfig16,
  border: InputsTypes.colorConfig9,
  backgroundColor: InputsTypes.colorConfig9,
}
type errorMessageConfig = {
  fontSize: ButtonSkeletonTypes.slotMaxHeightConfig,
  fontWeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  lineHeight: ButtonSkeletonTypes.slotMaxHeightConfig,
  color: string,
}
type bottomContainerConfig = {
  hintText: labelConfig10,
  errorMessage: errorMessageConfig,
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
