type stateToken2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type labelConfig14 = {
  fontSize: string,
  fontWeight: string,
  color: stateToken2,
}
type errorMessageConfig5 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type requiredConfig10 = {
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
type containerConfig14 = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantToken5 = {
  container: containerConfig14,
  @as("no-container") noContainer: containerConfig14,
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
  closed: string,
  error: string,
}
type variantToken6 = {
  container: triggerStateToken2,
  @as("no-container") noContainer: triggerStateToken2,
}
type slotConfig11 = {
  gap: string,
  width: string,
}
type countConfig2 = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type selectionTagTypeToken = {
  count: countConfig2,
  text: countConfig2,
}
type selectionTagConfig2 = {
  container: selectionTagTypeToken,
  @as("no-container") noContainer: selectionTagTypeToken,
  marginLeft: string,
  borderRadius: string,
}
type chevronConfig4 = {
  gap: string,
  width: string,
  height: string,
  iconSize?: float,
}
type clearButtonConfig = {
  backgroundColor: triggerStateToken2,
  outline: triggerStateToken2,
  color: string,
  width?: string,
}
type floatingLabelConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type placeholderConfig7 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type triggerConfig10 = {
  height: sizeToken3,
  padding: sizeToken4,
  borderRadius: sizeToken3,
  boxShadow: variantToken4,
  backgroundColor: variantToken6,
  outline: variantToken6,
  slot: slotConfig11,
  selectionTag: selectionTagConfig2,
  chevron: chevronConfig4,
  clearButton?: clearButtonConfig,
  floatingLabel: floatingLabelConfig,
  placeholder: placeholderConfig7,
  selectedValue: placeholderConfig7,
}
type scrollConfig = {
  height: string,
  maxHeight: string,
}
type headerConfig19 = {
  backgroundColor: string,
  borderBottom: string,
  selectAllRowPaddingLeft: string,
  selectAllRowPaddingRight: string,
}
type selectAllConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderRadius: string,
}
type actionsConfig3 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  gap: string,
  backgroundColor: string,
  borderTop: string,
}
type optionsLabelConfig3 = {
  fontSize: string,
  fontWeight: string,
  color: stateToken2,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type seperatorConfig4 = {
  color: string,
  height: string,
  margin: string,
}
type itemConfig11 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateToken2,
  optionsLabel: optionsLabelConfig3,
  option: labelConfig14,
  description: labelConfig14,
  seperator: seperatorConfig4,
}
type menuConfig5 = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: sizeToken4,
  minWidth: string,
  scroll: scrollConfig,
  header: headerConfig19,
  selectAll: selectAllConfig,
  list: floatingLabelConfig,
  actions: actionsConfig3,
  item: itemConfig11,
}
type triggerConfig11 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
}
type contentConfig16 = {
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type subMenuConfig = {
  trigger: triggerConfig11,
  content: contentConfig16,
}
type headerConfig20 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type searchConfig3 = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginBottom: string,
}
type contentConfig17 = {
  gap: string,
}
type drawerConfig4 = {
  header: headerConfig20,
  search: searchConfig3,
  content: contentConfig17,
}
type multiSelectV2TokensType = {
  gap: string,
  label: labelConfig14,
  subLabel: labelConfig14,
  hintText: labelConfig14,
  errorMessage: errorMessageConfig5,
  required: requiredConfig10,
  trigger: triggerConfig10,
  menu: menuConfig5,
  subMenu: subMenuConfig,
  drawer: drawerConfig4,
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
type componentTokensConfig = {
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
  componentTokens: componentTokensConfig,
  breakpoints: BreakpointsTypes.breakpointType,
  theme: string,
}
