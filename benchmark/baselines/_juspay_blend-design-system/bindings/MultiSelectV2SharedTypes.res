type stateToken2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type multiSelectV2MultiSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateToken2,
}
type multiSelectV2MultiSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type multiSelectV2MultiSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantToken4 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeToken3 = {
  sm: variantToken4,
  md: variantToken4,
  lg: variantToken4,
}
type multiSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantToken5 = {
  container: multiSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: multiSelectV2VariantTokenContainerConfig,
}
type sizeToken4 = {
  sm: variantToken5,
  md: variantToken5,
  lg: variantToken5,
}
type triggerStateToken2 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type variantToken6 = {
  container: triggerStateToken2,
  @as("no-container") noContainer: triggerStateToken2,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerSlotConfig = {
  gap: string,
  width: string,
}
type multiSelectV2SelectionTagTypeTokenCountConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type selectionTagTypeToken = {
  count: multiSelectV2SelectionTagTypeTokenCountConfig,
  text: multiSelectV2SelectionTagTypeTokenCountConfig,
}
type contextMultiSelectV2TokensTypeTriggerSelectionTagConfig = {
  container: selectionTagTypeToken,
  @as("no-container") noContainer: selectionTagTypeToken,
  marginLeft: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerChevronConfig = {
  gap: string,
  width: string,
  height: string,
  iconSize?: float,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerClearButtonConfig = {
  backgroundColor: triggerStateToken2,
  outline: triggerStateToken2,
  color: string,
  width?: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerConfig = {
  height: sizeToken3,
  padding: sizeToken4,
  borderRadius: sizeToken3,
  boxShadow: variantToken4,
  backgroundColor: variantToken6,
  outline: variantToken6,
  slot: multiSelectV2MultiSelectV2TokensTypeTriggerSlotConfig,
  selectionTag: contextMultiSelectV2TokensTypeTriggerSelectionTagConfig,
  chevron: multiSelectV2MultiSelectV2TokensTypeTriggerChevronConfig,
  clearButton?: multiSelectV2MultiSelectV2TokensTypeTriggerClearButtonConfig,
  floatingLabel: multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig,
  placeholder: multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig,
  selectedValue: multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig,
}
type multiSelectV2MultiSelectV2TokensTypeMenuScrollConfig = {
  height: string,
  maxHeight: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  selectAllRowPaddingLeft: string,
  selectAllRowPaddingRight: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuSelectAllConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuActionsConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  gap: string,
  backgroundColor: string,
  borderTop: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateToken2,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateToken2,
  optionsLabel: multiSelectV2MultiSelectV2TokensTypeMenuItemOptionsLabelConfig,
  option: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  description: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  seperator: multiSelectV2MultiSelectV2TokensTypeMenuItemSeperatorConfig,
}
type multiSelectV2MultiSelectV2TokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: sizeToken4,
  minWidth: string,
  scroll: multiSelectV2MultiSelectV2TokensTypeMenuScrollConfig,
  header: multiSelectV2MultiSelectV2TokensTypeMenuHeaderConfig,
  selectAll: multiSelectV2MultiSelectV2TokensTypeMenuSelectAllConfig,
  list: multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig,
  actions: multiSelectV2MultiSelectV2TokensTypeMenuActionsConfig,
  item: multiSelectV2MultiSelectV2TokensTypeMenuItemConfig,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuTriggerConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuContentConfig = {
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuConfig = {
  trigger: multiSelectV2MultiSelectV2TokensTypeSubMenuTriggerConfig,
  content: multiSelectV2MultiSelectV2TokensTypeSubMenuContentConfig,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerHeaderConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerSearchConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginBottom: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerContentConfig = {
  gap: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerConfig = {
  header: multiSelectV2MultiSelectV2TokensTypeDrawerHeaderConfig,
  search: multiSelectV2MultiSelectV2TokensTypeDrawerSearchConfig,
  content: multiSelectV2MultiSelectV2TokensTypeDrawerContentConfig,
}
type multiSelectV2TokensType = {
  gap: string,
  label: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  subLabel: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  hintText: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  errorMessage: multiSelectV2MultiSelectV2TokensTypeErrorMessageConfig,
  required: multiSelectV2MultiSelectV2TokensTypeRequiredConfig,
  trigger: multiSelectV2MultiSelectV2TokensTypeTriggerConfig,
  menu: multiSelectV2MultiSelectV2TokensTypeMenuConfig,
  subMenu: multiSelectV2MultiSelectV2TokensTypeSubMenuConfig,
  drawer: multiSelectV2MultiSelectV2TokensTypeDrawerConfig,
}
type responsiveMultiSelectV2Tokens = {
  sm: multiSelectV2TokensType,
  lg: multiSelectV2TokensType,
}
type componentTokenType = {
  @as("TAGS") tAGS?: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") sEARCH_INPUT?: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") tEXT_AREA?: InputsTypes.responsiveTextAreaTokens,
  @as("RADIO") rADIO?: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") sWITCH?: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") tEXT_INPUT?: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") nUMBER_INPUT?: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") aLERT?: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") oTP_INPUT?: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tOOLTIP?: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") uNIT_INPUT?: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") mULTI_VALUE_INPUT?: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dROPDOWN_INPUT?: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") cHECKBOX?: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tABS?: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") bUTTON?: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") mODAL?: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") bREADCRUMB?: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") pOPOVER?: PopoverTypes.responsivePopoverTokens,
  @as("MENU") mENU?: MenuTypes.responsiveMenuTokensType,
  @as("MULTI_SELECT") mULTI_SELECT?: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") sINGLE_SELECT?: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") tABLE?: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") cALENDAR?: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") aCCORDION?: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") sTAT_CARD?: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") pROGRESS_BAR?: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") dRAWER?: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") cHARTS?: ChartsTypes.responsiveChartTokens,
  @as("SNACKBAR") sNACKBAR?: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") sTEPPER?: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") kEYVALUEPAIR?: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") cARD?: CardTypes.responsiveCardTokens,
  @as("SKELETON") sKELETON?: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") tOPBAR?: TopbarTypes.responsiveTopbarTokens,
  @as("AVATAR") aVATAR?: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") aVATAR_GROUP?: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sIDEBAR?: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") dIRECTORY?: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mOBILE_NAVIGATION?: SidebarTypes.responsiveMobileNavigationTokens,
  @as("UPLOAD") uPLOAD?: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") cODE_BLOCK?: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") cHAT_INPUT?: ChatInputTypes.responsiveChatInputTokensType,
  @as("TIMELINE") tIMELINE?: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") bUTTONV2?: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tAGV2?: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") aLERTV2?: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") aCCORDIONV2?: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") sNACKBARV2?: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") sWITCHV2?: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") sINGLE_SELECT_V2?: SingleSelectV2Types.responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") mULTI_SELECT_V2?: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") aVATARV2?: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") tEXT_INPUTV2?: InputsV2Types.responsiveTextInputV2Tokens,
  @as("CHARTSV2") cHARTSV2?: HighchartsSharedTypes.responsiveChartV2Tokens,
  @as("CHECKBOXV2") cHECKBOXV2?: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") kEYVALUEPAIRV2?: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("TOOLTIPV2") tOOLTIPV2?: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") rADIOV2?: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") pOPOVERV2?: PopoverV2Types.responsivePopoverV2Tokens,
}
type contextThemeContextTypeComponentTokensConfig = {
  @as("TAGS") tAGS: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") sEARCH_INPUT: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") tEXT_AREA: InputsTypes.responsiveTextAreaTokens,
  @as("RADIO") rADIO: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") sWITCH: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") tEXT_INPUT: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") nUMBER_INPUT: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") aLERT: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") oTP_INPUT: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tOOLTIP: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") uNIT_INPUT: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") mULTI_VALUE_INPUT: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dROPDOWN_INPUT: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") cHECKBOX: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tABS: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") bUTTON: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") mODAL: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") bREADCRUMB: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") pOPOVER: PopoverTypes.responsivePopoverTokens,
  @as("MENU") mENU: MenuTypes.responsiveMenuTokensType,
  @as("MULTI_SELECT") mULTI_SELECT: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") sINGLE_SELECT: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") tABLE: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") cALENDAR: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") aCCORDION: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") sTAT_CARD: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") pROGRESS_BAR: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") dRAWER: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") cHARTS: ChartsTypes.responsiveChartTokens,
  @as("SNACKBAR") sNACKBAR: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") sTEPPER: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") kEYVALUEPAIR: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") cARD: CardTypes.responsiveCardTokens,
  @as("SKELETON") sKELETON: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") tOPBAR: TopbarTypes.responsiveTopbarTokens,
  @as("AVATAR") aVATAR: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") aVATAR_GROUP: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sIDEBAR: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") dIRECTORY: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mOBILE_NAVIGATION: SidebarTypes.responsiveMobileNavigationTokens,
  @as("UPLOAD") uPLOAD: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") cODE_BLOCK: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") cHAT_INPUT: ChatInputTypes.responsiveChatInputTokensType,
  @as("TIMELINE") tIMELINE: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") bUTTONV2: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tAGV2: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") aLERTV2: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") aCCORDIONV2: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") sNACKBARV2: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") sWITCHV2: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") sINGLE_SELECT_V2: SingleSelectV2Types.responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") mULTI_SELECT_V2: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") aVATARV2: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") tEXT_INPUTV2: InputsV2Types.responsiveTextInputV2Tokens,
  @as("CHARTSV2") cHARTSV2: HighchartsSharedTypes.responsiveChartV2Tokens,
  @as("CHECKBOXV2") cHECKBOXV2: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") kEYVALUEPAIRV2: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("TOOLTIPV2") tOOLTIPV2: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") rADIOV2: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") pOPOVERV2: PopoverV2Types.responsivePopoverV2Tokens,
}
type themeContextType = {
  foundationTokens: TokensTypes.foundationTokenType,
  componentTokens: contextThemeContextTypeComponentTokensConfig,
  breakpoints: BreakpointsTypes.breakpointType,
  theme: string,
}
