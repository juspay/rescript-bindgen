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
  calculateEndDate?: (Date.t, option<dateRange>) => Nullable.t<Date.t>,
  fixedDayRange?: float,
  referenceRange?: dateRange,
  backwardDays?: float,
  allowManualEndDateSelection?: bool,
  applyToPresets?: bool,
}
type dateRangePickerCustomFormatConfig = {
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
}
type dateFormatConfig = {
  preset?: dateFormatPreset,
  customFormat?: (dateRange, option<dateRangePickerCustomFormatConfig>) => string,
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
  timeFormat?: timeFormat,
}
type dateRangePickerRenderTriggerConfig = {
  selectedRange?: dateRange,
  isOpen: bool,
  isDisabled: bool,
  formattedValue: string,
  onClick: unit => unit,
}
type triggerConfig = {
  element?: React.element,
  placeholder?: string,
  showIcon?: bool,
  icon?: React.element,
  style?: JsxDOM.style,
  renderTrigger?: dateRangePickerRenderTriggerConfig => React.element,
}
type dateRangePickerBorderRadiusConfig = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
}
type dateRangePickerSmConfig = {
  x: string,
  y: string,
}
type dateRangePickerPaddingConfig = {
  sm: dateRangePickerSmConfig,
  lg: dateRangePickerSmConfig,
  md: dateRangePickerSmConfig,
}
type dateRangePickerDisabledConfig = {
  left: string,
  top: string,
  bottom: string,
  right: string,
}
type dateRangePickerBorderConfig = {
  disabled: dateRangePickerDisabledConfig,
  default: dateRangePickerDisabledConfig,
  hover: dateRangePickerDisabledConfig,
  active: dateRangePickerDisabledConfig,
}
type dateRangePickerFontSizeConfig = {
  sm: string,
  lg: string,
  md: string,
}
type dateRangePickerTextConfig = {
  color: string,
  fontWeight: string,
  fontSize: dateRangePickerFontSizeConfig,
}
type dateRangePickerQuickSelectorConfig = {
  borderRadius: dateRangePickerBorderRadiusConfig,
  backgroundColor: string,
  gap: string,
  padding: dateRangePickerPaddingConfig,
  border: dateRangePickerBorderConfig,
  text: dateRangePickerTextConfig,
  iconSize: string,
}
type dateRangePickerBorderRadiusConfig2 = {
  withQuickSelector: string,
  withoutQuickSelector: string,
}
type dateRangePickerTextConfig2 = {
  color: string,
  fontSize: dateRangePickerFontSizeConfig,
  fontWeight: string,
}
type dateRangePickerBorderConfig2 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type dateRangePickerDateInputConfig = {
  borderRadius: dateRangePickerBorderRadiusConfig2,
  padding: dateRangePickerPaddingConfig,
  text: dateRangePickerTextConfig2,
  border: dateRangePickerBorderConfig2,
  backgroundColor: string,
  iconSize: string,
  gap: string,
}
type dateRangePickerTriggerConfig = {
  quickSelector: dateRangePickerQuickSelectorConfig,
  dateInput: dateRangePickerDateInputConfig,
}
type dateRangePickerPaddingConfig2 = {
  x: string,
  y: string,
}
type dateRangePickerLabelConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type dateRangePickerDateInputConfig2 = {
  gap: string,
  label: dateRangePickerLabelConfig,
}
type dateRangePickerHeaderConfig = {
  padding: dateRangePickerPaddingConfig2,
  dateInput: dateRangePickerDateInputConfig2,
}
type dateRangePickerHeaderConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: dateRangePickerPaddingConfig2,
  gap: string,
}
type dateRangePickerMonthConfig = {
  header: dateRangePickerHeaderConfig2,
}
type dateRangePickerRowConfig = {
  gap: string,
}
type dateRangePickerWeekConfig = {
  gap: string,
  fontSize: string,
  fontWeight: string,
  boxShadow: string,
  color: string,
  padding: dateRangePickerSmConfig,
  row: dateRangePickerRowConfig,
}
type dateRangePickerCellConfig = {
  padding: dateRangePickerPaddingConfig2,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
  border: dateRangePickerBorderConfig2,
  borderRadius: string,
}
type dateRangePickerStatesConfig = {
  startDate: string,
  endDate: string,
  singleDate: string,
  rangeDay: string,
  todayDay: string,
  disabledDay: string,
}
type dateRangePickerTextConfig3 = {
  dayNumber: string,
  selectedDay: string,
  rangeDay: string,
  todayDay: string,
  disabledDate: string,
}
type dateRangePickerTodayIndicatorConfig = {
  width: string,
  backgroundColor: string,
}
type dateRangePickerDayConfig = {
  cell: dateRangePickerCellConfig,
  states: dateRangePickerStatesConfig,
  text: dateRangePickerTextConfig3,
  todayIndicator: dateRangePickerTodayIndicatorConfig,
}
type dateRangePickerCalendarGridConfig = {
  month: dateRangePickerMonthConfig,
  week: dateRangePickerWeekConfig,
  day: dateRangePickerDayConfig,
}
type dateRangePickerFooterConfig = {
  padding: dateRangePickerPaddingConfig2,
  borderTop: string,
  gap: string,
}
type dateRangePickerCalendarConfig = {
  minWidth: string,
  width: string,
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  header: dateRangePickerHeaderConfig,
  calendarGrid: dateRangePickerCalendarGridConfig,
  footer: dateRangePickerFooterConfig,
}
type calendarTokenType = {
  trigger: dateRangePickerTriggerConfig,
  calendar: dateRangePickerCalendarConfig,
}
type responsiveCalendarTokens = {
  sm: calendarTokenType,
  lg: calendarTokenType,
}
