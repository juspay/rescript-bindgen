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
type dateRangePickerDateFormatConfigTimeFormat =
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
type customPresetConfig = {
  preset: dateRangePreset,
  label?: string,
  visible?: bool,
}
type customPresetDefinition = {
  id: string,
  label: string,
  getDateRange: unit => dateRange,
  visible?: bool,
}
type customRangeConfig = {
  calculateEndDate?: (Date.t, option<dateRange>) => Nullable.t<Date.t>,
  fixedDayRange?: float,
  referenceRange?: dateRange,
  backwardDays?: float,
  allowManualEndDateSelection?: bool,
  applyToPresets?: bool,
}
type dateRangePickerDateFormatConfigCustomFormatConfig = {
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
}
type dateFormatConfig = {
  preset?: dateFormatPreset,
  customFormat?: (dateRange, option<dateRangePickerDateFormatConfigCustomFormatConfig>) => string,
  includeTime?: bool,
  includeYear?: bool,
  separator?: string,
  locale?: string,
  timeFormat?: dateRangePickerDateFormatConfigTimeFormat,
}
type dateRangePickerTriggerConfigRenderTriggerConfig = {
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
  renderTrigger?: dateRangePickerTriggerConfigRenderTriggerConfig => React.element,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderRadiusConfig = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig = {
  x: string,
  y: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingConfig = {
  sm: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  lg: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  md: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig = {
  left: string,
  top: string,
  bottom: string,
  right: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderConfig = {
  disabled: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  default: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  hover: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  active: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextFontSizeConfig = {
  sm: string,
  lg: string,
  md: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextConfig = {
  color: string,
  fontWeight: string,
  fontSize: dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextFontSizeConfig,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorConfig = {
  borderRadius: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderRadiusConfig,
  backgroundColor: string,
  gap: string,
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingConfig,
  border: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderConfig,
  text: dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextConfig,
  iconSize: string,
}
type dateRangePickerCalendarTokenTypeTriggerDateInputBorderRadiusConfig = {
  withQuickSelector: string,
  withoutQuickSelector: string,
}
type dateRangePickerCalendarTokenTypeTriggerDateInputTextConfig = {
  color: string,
  fontSize: dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextFontSizeConfig,
  fontWeight: string,
}
type dateRangePickerCalendarTokenTypeTriggerDateInputBorderConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type dateRangePickerCalendarTokenTypeTriggerDateInputConfig = {
  borderRadius: dateRangePickerCalendarTokenTypeTriggerDateInputBorderRadiusConfig,
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingConfig,
  text: dateRangePickerCalendarTokenTypeTriggerDateInputTextConfig,
  border: dateRangePickerCalendarTokenTypeTriggerDateInputBorderConfig,
  backgroundColor: string,
  iconSize: string,
  gap: string,
}
type dateRangePickerCalendarTokenTypeTriggerConfig = {
  quickSelector: dateRangePickerCalendarTokenTypeTriggerQuickSelectorConfig,
  dateInput: dateRangePickerCalendarTokenTypeTriggerDateInputConfig,
}
type dateRangePickerCalendarTokenTypeCalendarHeaderDateInputLabelConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type dateRangePickerCalendarTokenTypeCalendarHeaderDateInputConfig = {
  gap: string,
  label: dateRangePickerCalendarTokenTypeCalendarHeaderDateInputLabelConfig,
}
type dateRangePickerCalendarTokenTypeCalendarHeaderConfig = {
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  dateInput: dateRangePickerCalendarTokenTypeCalendarHeaderDateInputConfig,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridMonthHeaderConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  gap: string,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridMonthConfig = {
  header: dateRangePickerCalendarTokenTypeCalendarCalendarGridMonthHeaderConfig,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridWeekRowConfig = {
  gap: string,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridWeekConfig = {
  gap: string,
  fontSize: string,
  fontWeight: string,
  boxShadow: string,
  color: string,
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  row: dateRangePickerCalendarTokenTypeCalendarCalendarGridWeekRowConfig,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayCellConfig = {
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
  border: string,  // ⚪ loose — was `{ disabled: Border<number | (string & {})>; default: Border<number | (string & {})>; hover: Border<number | (s`
  borderRadius: string,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayStatesConfig = {
  startDate: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderRadius: { topLeft: BorderTopLeftRadius<number | (string & {})>; bott`
  endDate: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderRadius: { topRight: BorderTopRightRadius<number | (string & {})>; bo`
  singleDate: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderRadius: BorderRadius<number | (string & {})>; }`
  rangeDay: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; }`
  todayDay: string,  // ⚪ loose — was `{ fontWeight: FontWeight; }`
  disabledDay: string,  // ⚪ loose — was `{ color: Color; }`
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayTextConfig = {
  dayNumber: string,  // ⚪ loose — was `{ color: Color; }`
  selectedDay: string,  // ⚪ loose — was `{ color: Color; }`
  rangeDay: string,  // ⚪ loose — was `{ color: Color; }`
  todayDay: string,  // ⚪ loose — was `{ color: Color; }`
  disabledDate: string,  // ⚪ loose — was `{ color: Color; }`
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayTodayIndicatorConfig = {
  width: string,
  backgroundColor: string,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayConfig = {
  cell: dateRangePickerCalendarTokenTypeCalendarCalendarGridDayCellConfig,
  states: dateRangePickerCalendarTokenTypeCalendarCalendarGridDayStatesConfig,
  text: dateRangePickerCalendarTokenTypeCalendarCalendarGridDayTextConfig,
  todayIndicator: dateRangePickerCalendarTokenTypeCalendarCalendarGridDayTodayIndicatorConfig,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridConfig = {
  month: dateRangePickerCalendarTokenTypeCalendarCalendarGridMonthConfig,
  week: dateRangePickerCalendarTokenTypeCalendarCalendarGridWeekConfig,
  day: dateRangePickerCalendarTokenTypeCalendarCalendarGridDayConfig,
}
type dateRangePickerCalendarTokenTypeCalendarFooterConfig = {
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  borderTop: string,
  gap: string,
}
type dateRangePickerCalendarTokenTypeCalendarConfig = {
  minWidth: string,
  width: string,
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  header: dateRangePickerCalendarTokenTypeCalendarHeaderConfig,
  calendarGrid: dateRangePickerCalendarTokenTypeCalendarCalendarGridConfig,
  footer: dateRangePickerCalendarTokenTypeCalendarFooterConfig,
}
type calendarTokenType = {
  trigger: dateRangePickerCalendarTokenTypeTriggerConfig,
  calendar: dateRangePickerCalendarTokenTypeCalendarConfig,
}
type responsiveCalendarTokens = {
  sm: calendarTokenType,
  lg: calendarTokenType,
}
module PresetsConfig = {
  type t
  external fromDateRangePreset: dateRangePreset => t = "%identity"
  external asDateRangePreset: t => (dateRangePreset) = "%identity"
  external fromCustomPresetConfig: customPresetConfig => t = "%identity"
  external asCustomPresetConfig: t => (customPresetConfig) = "%identity"
  external fromCustomPresetDefinition: customPresetDefinition => t = "%identity"
  external asCustomPresetDefinition: t => (customPresetDefinition) = "%identity"
}
