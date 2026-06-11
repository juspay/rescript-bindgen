type dateRangePreset =
  | @as("custom") Custom
  | @as("today") Today
  | @as("yesterday") Yesterday
  | @as("tomorrow") Tomorrow
  | @as("last30Minutes") Last30Minutes
  | @as("last1Hour") Last1Hour
  | @as("last6Hours") Last6Hours
  | @as("last24Hours") Last24Hours
  | @as("last7Days") Last7Days
  | @as("last30Days") Last30Days
  | @as("thisMonth") ThisMonth
  | @as("lastMonth") LastMonth
  | @as("last3Months") Last3Months
  | @as("last12Months") Last12Months
  | @as("next7Days") Next7Days
  | @as("next30Days") Next30Days
  | @as("next3Months") Next3Months
  | @as("next12Months") Next12Months
type dateRangePickerSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type dateFormatPreset =
  | @as("short-range") ShortRange
  | @as("medium-range") MediumRange
  | @as("long-range") LongRange
  | @as("short-single") ShortSingle
  | @as("medium-single") MediumSingle
  | @as("long-single") LongSingle
  | @as("iso-range") IsoRange
  | @as("us-range") UsRange
  | @as("custom") Custom
type timeFormat =
  | @as("12h") V12h
  | @as("24h") V24h
type dateRange = {
  startDate: Date.t,
  endDate?: Date.t,
  showTimePicker?: bool,
}
type presetSelectionData = {
  preset: dateRangePreset,
  label: string,
  dateRange: dateRange,
  formattedStartDate: string,
  formattedEndDate: string,
  formattedStartTime: string,
  formattedEndTime: string,
}
type presetsConfig = {
  ...JsxDOM.domProps,
}
type customRangeConfig = {
  calculateEndDate?: (Date.t, option<dateRange>) => Date.t,
  fixedDayRange?: float,
  referenceRange?: dateRange,
  backwardDays?: float,
  allowManualEndDateSelection?: bool,
  applyToPresets?: bool,
}
type customFormatConfig = {
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
}
type dateFormatConfig = {
  preset?: dateFormatPreset,
  customFormat?: (dateRange, option<customFormatConfig>) => string,
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
  timeFormat?: timeFormat,
}
type renderTriggerConfig = {
  selectedRange: dateRange,
  isOpen: bool,
  isDisabled: bool,
  formattedValue: string,
  onClick: unit => unit,
}
type triggerConfig3 = {
  element?: React.element,
  placeholder?: string,
  showIcon?: bool,
  icon?: React.element,
  style?: JsxDOM.style,
  renderTrigger?: renderTriggerConfig => React.element,
}
type borderRadiusConfig6 = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
}
type paddingConfig7 = {
  sm: ButtonSharedTypes.defaultConfig3,
  lg: ButtonSharedTypes.defaultConfig3,
  md: ButtonSharedTypes.defaultConfig3,
}
type disabledConfig = {
  left: string,
  top: string,
  bottom: string,
  right: string,
}
type borderConfig5 = {
  disabled: disabledConfig,
  default: disabledConfig,
  hover: disabledConfig,
  active: disabledConfig,
}
type fontSizeConfig4 = {
  sm: string,
  lg: string,
  md: string,
}
type textConfig11 = {
  color: string,
  fontWeight: string,
  fontSize: fontSizeConfig4,
}
type quickSelectorConfig = {
  borderRadius: borderRadiusConfig6,
  backgroundColor: string,
  gap: string,
  padding: paddingConfig7,
  border: borderConfig5,
  text: textConfig11,
  iconSize: string,
}
type borderRadiusConfig7 = {
  withQuickSelector: string,
  withoutQuickSelector: string,
}
type textConfig12 = {
  color: string,
  fontSize: fontSizeConfig4,
  fontWeight: string,
}
type dateInputConfig = {
  borderRadius: borderRadiusConfig7,
  padding: paddingConfig7,
  text: textConfig12,
  border: TabsTypes.boxedConfig,
  backgroundColor: string,
  iconSize: string,
  gap: string,
}
type triggerConfig4 = {
  quickSelector: quickSelectorConfig,
  dateInput: dateInputConfig,
}
type labelConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type dateInputConfig2 = {
  gap: string,
  label: labelConfig,
}
type headerConfig4 = {
  padding: ModalTypes.paddingConfig5,
  dateInput: dateInputConfig2,
}
type headerConfig5 = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: ModalTypes.paddingConfig5,
  gap: string,
}
type monthConfig = {
  header: headerConfig5,
}
type rowConfig = {
  gap: string,
}
type weekConfig = {
  gap: string,
  fontSize: string,
  fontWeight: string,
  boxShadow: string,
  color: string,
  padding: ButtonSharedTypes.defaultConfig3,
  row: rowConfig,
}
type cellConfig = {
  padding: ModalTypes.paddingConfig5,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
  border: TabsTypes.boxedConfig,
  borderRadius: string,
}
type statesConfig = {
  startDate: string,
  endDate: string,
  singleDate: string,
  rangeDay: string,
  todayDay: string,
  disabledDay: string,
}
type textConfig13 = {
  dayNumber: AvatarGroupTypes.textConfig7,
  selectedDay: AvatarGroupTypes.textConfig7,
  rangeDay: AvatarGroupTypes.textConfig7,
  todayDay: AvatarGroupTypes.textConfig7,
  disabledDate: AvatarGroupTypes.textConfig7,
}
type todayIndicatorConfig = {
  width: string,
  backgroundColor: string,
}
type dayConfig = {
  cell: cellConfig,
  states: statesConfig,
  text: textConfig13,
  todayIndicator: todayIndicatorConfig,
}
type calendarGridConfig = {
  month: monthConfig,
  week: weekConfig,
  day: dayConfig,
}
type footerConfig3 = {
  padding: ModalTypes.paddingConfig5,
  borderTop: string,
  gap: string,
}
type calendarConfig = {
  minWidth: string,
  width: string,
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  header: headerConfig4,
  calendarGrid: calendarGridConfig,
  footer: footerConfig3,
}
type calendarTokenType = {
  trigger: triggerConfig4,
  calendar: calendarConfig,
}
type responsiveCalendarTokens = {
  sm: calendarTokenType,
  lg: calendarTokenType,
}
