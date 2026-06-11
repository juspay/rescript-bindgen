type variantToken = {
  container: TabsTypes.boxedConfig3,
  @as("no-container") noContainer: TabsTypes.boxedConfig3,
}
type sizeToken = {
  sm: variantToken,
  md: variantToken,
  lg: variantToken,
}
type slotConfig9 = {
  gap: string,
  width: string,
}
type triggerConfig8 = {
  height: MultiSelectSharedTypes.heightConfig,
  padding: sizeToken,
  borderRadius: MultiSelectSharedTypes.heightConfig,
  boxShadow: MultiSelectSharedTypes.smConfig8,
  backgroundColor: MultiSelectSharedTypes.backgroundColorConfig8,
  outline: MultiSelectSharedTypes.backgroundColorConfig8,
  slot: slotConfig9,
  placeholder: ModalTypes.titleConfig,
  selectedValue: ModalTypes.titleConfig,
}
type contentConfig12 = {
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
  color: MultiSelectSharedTypes.colorConfig12,
}
type itemConfig10 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: MultiSelectSharedTypes.colorConfig12,
  groupLabelText: MultiSelectSharedTypes.labelConfig3,
  option: MultiSelectSharedTypes.labelConfig3,
  description: MultiSelectSharedTypes.labelConfig3,
  separator: MultiSelectSharedTypes.seperatorConfig2,
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
type contentConfig13 = {
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
  content: contentConfig13,
  optionText: StatCardTypes.titleConfig3,
  iconColor: string,
}
type menuConfig4 = {
  content: contentConfig12,
  padding: sizeToken,
  groupLabel: groupLabelConfig,
  item: itemConfig10,
  submenu: submenuConfig,
}
type headerConfig17 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type mobilePanelConfig = {
  header: headerConfig17,
}
type singleSelectV2TokensType = {
  gap: string,
  label: MultiSelectSharedTypes.labelConfig3,
  subLabel: MultiSelectSharedTypes.labelConfig3,
  hintText: MultiSelectSharedTypes.labelConfig3,
  errorMessage: StatCardTypes.titleConfig3,
  required: AvatarGroupTypes.textConfig7,
  trigger: triggerConfig8,
  menu: menuConfig4,
  mobilePanel: mobilePanelConfig,
}
type responsiveSingleSelectV2Tokens = {
  sm: singleSelectV2TokensType,
  lg: singleSelectV2TokensType,
}
