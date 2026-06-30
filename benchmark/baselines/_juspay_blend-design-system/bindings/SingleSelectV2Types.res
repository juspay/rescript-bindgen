type stateToken = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type singleSelectV2SingleSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateToken,
}
type singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type singleSelectV2SingleSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantToken = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeToken = {
  sm: variantToken,
  md: variantToken,
  lg: variantToken,
}
type singleSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantToken2 = {
  container: singleSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: singleSelectV2VariantTokenContainerConfig,
}
type sizeToken2 = {
  sm: variantToken2,
  md: variantToken2,
  lg: variantToken2,
}
type triggerStateToken = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type variantToken3 = {
  container: triggerStateToken,
  @as("no-container") noContainer: triggerStateToken,
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
  height: sizeToken,
  padding: sizeToken2,
  borderRadius: sizeToken,
  boxShadow: variantToken,
  backgroundColor: variantToken3,
  outline: variantToken3,
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
  color: stateToken,
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
  backgroundColor: stateToken,
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
  padding: sizeToken2,
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
