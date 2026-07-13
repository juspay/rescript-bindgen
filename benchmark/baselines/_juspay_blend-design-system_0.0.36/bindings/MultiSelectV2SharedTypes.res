type stateTokenMultiSelectV2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  selected: string,
  focus: string,
  focusVisible: string,
}
type multiSelectV2MultiSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateTokenMultiSelectV2,
}
type multiSelectV2MultiSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type multiSelectV2MultiSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantTokenV1p7v12 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenI7cok2 = {
  sm: variantTokenV1p7v12,
  md: variantTokenV1p7v12,
  lg: variantTokenV1p7v12,
}
type multiSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantTokenV1k1l6 = {
  container: multiSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: multiSelectV2VariantTokenContainerConfig,
}
type sizeTokenV3ngv6 = {
  sm: variantTokenV1k1l6,
  md: variantTokenV1k1l6,
  lg: variantTokenV1k1l6,
}
type triggerStateTokenMultiSelectV2 = {
  hover: string,
  @as("open") open_: string,
  focus: string,
  error: string,
  closed: string,
}
type variantTokenV1omnb2 = {
  container: triggerStateTokenMultiSelectV2,
  @as("no-container") noContainer: triggerStateTokenMultiSelectV2,
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
  backgroundColor: triggerStateTokenMultiSelectV2,
  outline: triggerStateTokenMultiSelectV2,
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
  height: sizeTokenI7cok2,
  padding: sizeTokenV3ngv6,
  borderRadius: sizeTokenI7cok2,
  boxShadow: variantTokenV1p7v12,
  backgroundColor: variantTokenV1omnb2,
  outline: variantTokenV1omnb2,
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
  color: stateTokenMultiSelectV2,
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
  backgroundColor: stateTokenMultiSelectV2,
  optionsLabel: multiSelectV2MultiSelectV2TokensTypeMenuItemOptionsLabelConfig,
  option: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  description: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  seperator: multiSelectV2MultiSelectV2TokensTypeMenuItemSeperatorConfig,
}
type multiSelectV2MultiSelectV2TokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: sizeTokenV3ngv6,
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
  @as("TAGS") tags?: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") searchInput?: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") textArea?: InputsTypes.responsiveTextAreaTokens,
  @as("RADIO") radio?: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") switch_?: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") textInput?: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") numberInput?: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") alert?: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") otpInput?: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tooltip?: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") unitInput?: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") multiValueInput?: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dropdownInput?: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") checkbox?: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tabs?: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") button?: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") modal?: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") breadcrumb?: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") popover?: PopoverTypes.responsivePopoverTokens,
  @as("MENU") menu?: MenuTypes.responsiveMenuTokensType,
  @as("MULTI_SELECT") multiSelect?: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") singleSelect?: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") table?: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") calendar?: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") accordion?: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") statCard?: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") progressBar?: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") drawer?: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") charts?: HighchartsSharedTypes.responsiveChartTokens,
  @as("SNACKBAR") snackbar?: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") stepper?: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") keyvaluepair?: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") card?: CardTypes.responsiveCardTokens,
  @as("SKELETON") skeleton?: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") topbar?: TopbarTypes.responsiveTopbarTokens,
  @as("AVATAR") avatar?: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") avatarGroup?: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sidebar?: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") directory?: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mobileNavigation?: SidebarTypes.responsiveMobileNavigationTokens,
  @as("UPLOAD") upload?: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") codeBlock?: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") chatInput?: ChatInputTypes.responsiveChatInputTokensType,
  @as("TIMELINE") timeline?: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") buttonv2?: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tagv2?: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") alertv2?: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") accordionv2?: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") snackbarv2?: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") switchv2?: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") singleSelectV2?: SingleSelectV2Types.responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") multiSelectV2?: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") avatarv2?: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") textInputv2?: InputsV2Types.responsiveTextInputV2Tokens,
  @as("CHARTSV2") chartsv2?: ChartsV2Types.responsiveChartV2Tokens,
  @as("CHECKBOXV2") checkboxv2?: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") keyvaluepairv2?: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("TOOLTIPV2") tooltipv2?: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") radiov2?: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") popoverv2?: PopoverV2Types.responsivePopoverV2Tokens,
}
type contextThemeContextTypeComponentTokensConfig = {
  @as("TAGS") tags: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") searchInput: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") textArea: InputsTypes.responsiveTextAreaTokens,
  @as("RADIO") radio: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") switch_: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") textInput: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") numberInput: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") alert: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") otpInput: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tooltip: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") unitInput: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") multiValueInput: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dropdownInput: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") checkbox: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tabs: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") button: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") modal: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") breadcrumb: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") popover: PopoverTypes.responsivePopoverTokens,
  @as("MENU") menu: MenuTypes.responsiveMenuTokensType,
  @as("MULTI_SELECT") multiSelect: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") singleSelect: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") table: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") calendar: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") accordion: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") statCard: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") progressBar: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") drawer: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") charts: HighchartsSharedTypes.responsiveChartTokens,
  @as("SNACKBAR") snackbar: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") stepper: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") keyvaluepair: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") card: CardTypes.responsiveCardTokens,
  @as("SKELETON") skeleton: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") topbar: TopbarTypes.responsiveTopbarTokens,
  @as("AVATAR") avatar: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") avatarGroup: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sidebar: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") directory: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mobileNavigation: SidebarTypes.responsiveMobileNavigationTokens,
  @as("UPLOAD") upload: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") codeBlock: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") chatInput: ChatInputTypes.responsiveChatInputTokensType,
  @as("TIMELINE") timeline: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") buttonv2: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tagv2: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") alertv2: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") accordionv2: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") snackbarv2: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") switchv2: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") singleSelectV2: SingleSelectV2Types.responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") multiSelectV2: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") avatarv2: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") textInputv2: InputsV2Types.responsiveTextInputV2Tokens,
  @as("CHARTSV2") chartsv2: ChartsV2Types.responsiveChartV2Tokens,
  @as("CHECKBOXV2") checkboxv2: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") keyvaluepairv2: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("TOOLTIPV2") tooltipv2: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") radiov2: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") popoverv2: PopoverV2Types.responsivePopoverV2Tokens,
}
type themeContextType = {
  foundationTokens: TokensTypes.foundationTokenType,
  componentTokens: contextThemeContextTypeComponentTokensConfig,
  breakpoints: BreakpointsTypes.breakpointType,
  theme: string,
}
