type stateTokenSingleSelectV2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  selected: string,
  focus: string,
  focusVisible: string,
}
type singleSelectV2SingleSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type singleSelectV2SingleSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantTokenV1p7v1 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenI7cok = {
  sm: variantTokenV1p7v1,
  md: variantTokenV1p7v1,
  lg: variantTokenV1p7v1,
}
type singleSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantTokenWwo0h = {
  container: singleSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: singleSelectV2VariantTokenContainerConfig,
}
type sizeTokenFjyre = {
  sm: variantTokenWwo0h,
  md: variantTokenWwo0h,
  lg: variantTokenWwo0h,
}
type triggerStateTokenSingleSelectV2 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type variantTokenV1omnb = {
  container: triggerStateTokenSingleSelectV2,
  @as("no-container") noContainer: triggerStateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerSlotConfig = {
  gap: string,
  width: string,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerConfig = {
  height: sizeTokenI7cok,
  padding: sizeTokenFjyre,
  borderRadius: sizeTokenI7cok,
  boxShadow: variantTokenV1p7v1,
  backgroundColor: variantTokenV1omnb,
  outline: variantTokenV1omnb,
  slot: singleSelectV2SingleSelectV2TokensTypeTriggerSlotConfig,
  placeholder: singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig,
  selectedValue: singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig,
}
type singleSelectV2SingleSelectV2TokensTypeMenuContentConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuGroupLabelConfig = {
  margin: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  fontSize: string,
  fontWeight: string,
  color: stateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeMenuItemSeparatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateTokenSingleSelectV2,
  groupLabelText: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  option: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  description: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  separator: singleSelectV2SingleSelectV2TokensTypeMenuItemSeparatorConfig,
}
type submenuTriggerStateToken = {
  default: string,
  hover: string,
  focus: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuTriggerConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  backgroundColor: submenuTriggerStateToken,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuContentConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  boxShadow: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig = {
  trigger: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuTriggerConfig,
  content: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuContentConfig,
  optionText: singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig,
  iconColor: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuConfig = {
  content: singleSelectV2SingleSelectV2TokensTypeMenuContentConfig,
  padding: sizeTokenFjyre,
  groupLabel: singleSelectV2SingleSelectV2TokensTypeMenuGroupLabelConfig,
  item: singleSelectV2SingleSelectV2TokensTypeMenuItemConfig,
  submenu: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig,
}
type singleSelectV2SingleSelectV2TokensTypeMobilePanelHeaderConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type singleSelectV2SingleSelectV2TokensTypeMobilePanelConfig = {
  header: singleSelectV2SingleSelectV2TokensTypeMobilePanelHeaderConfig,
}
type singleSelectV2TokensType = {
  gap: string,
  label: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  subLabel: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  hintText: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  errorMessage: singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig,
  required: singleSelectV2SingleSelectV2TokensTypeRequiredConfig,
  trigger: singleSelectV2SingleSelectV2TokensTypeTriggerConfig,
  menu: singleSelectV2SingleSelectV2TokensTypeMenuConfig,
  mobilePanel: singleSelectV2SingleSelectV2TokensTypeMobilePanelConfig,
}
type responsiveSingleSelectV2Tokens = {
  sm: singleSelectV2TokensType,
  lg: singleSelectV2TokensType,
}
