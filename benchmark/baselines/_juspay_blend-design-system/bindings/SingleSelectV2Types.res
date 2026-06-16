type stateToken = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type labelConfig13 = {
  fontSize: string,
  fontWeight: string,
  color: stateToken,
}
type errorMessageConfig4 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type requiredConfig9 = {
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
type containerConfig13 = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantToken2 = {
  container: containerConfig13,
  @as("no-container") noContainer: containerConfig13,
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
  closed: string,
  error: string,
}
type variantToken3 = {
  container: triggerStateToken,
  @as("no-container") noContainer: triggerStateToken,
}
type slotConfig10 = {
  gap: string,
  width: string,
}
type placeholderConfig6 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type triggerConfig8 = {
  height: sizeToken,
  padding: sizeToken2,
  borderRadius: sizeToken,
  boxShadow: variantToken,
  backgroundColor: variantToken3,
  outline: variantToken3,
  slot: slotConfig10,
  placeholder: placeholderConfig6,
  selectedValue: placeholderConfig6,
}
type contentConfig14 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
}
type groupLabelConfig = {
  margin: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  fontSize: string,
  fontWeight: string,
  color: stateToken,
}
type separatorConfig4 = {
  color: string,
  height: string,
  margin: string,
}
type itemConfig10 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateToken,
  groupLabelText: labelConfig13,
  option: labelConfig13,
  description: labelConfig13,
  separator: separatorConfig4,
}
type submenuTriggerStateToken = {
  default: string,
  hover: string,
  focus: string,
}
type triggerConfig9 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  backgroundColor: submenuTriggerStateToken,
}
type contentConfig15 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  boxShadow: string,
}
type submenuConfig = {
  trigger: triggerConfig9,
  content: contentConfig15,
  optionText: errorMessageConfig4,
  iconColor: string,
}
type menuConfig4 = {
  content: contentConfig14,
  padding: sizeToken2,
  groupLabel: groupLabelConfig,
  item: itemConfig10,
  submenu: submenuConfig,
}
type headerConfig18 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type mobilePanelConfig = {
  header: headerConfig18,
}
type singleSelectV2TokensType = {
  gap: string,
  label: labelConfig13,
  subLabel: labelConfig13,
  hintText: labelConfig13,
  errorMessage: errorMessageConfig4,
  required: requiredConfig9,
  trigger: triggerConfig8,
  menu: menuConfig4,
  mobilePanel: mobilePanelConfig,
}
type responsiveSingleSelectV2Tokens = {
  sm: singleSelectV2TokensType,
  lg: singleSelectV2TokensType,
}
