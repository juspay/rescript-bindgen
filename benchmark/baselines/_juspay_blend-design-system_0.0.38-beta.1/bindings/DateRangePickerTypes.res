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
type dateRangePickerDateRangePickerPropsGranularity =
  | @as("month") Month
  | @as("day") Day
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
type dateRangePickerDateRangePickerPopoverConfigSide =
  | @as("top") Top
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("left") Left
type dateRangePickerDateRangePickerPopoverConfigAlign =
  | @as("center") Center
  | @as("end") End
  | @as("start") Start
type __typeV1sjik = {
  topLeft: string,
  topRight: string,
  bottomLeft: string,
  bottomRight: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorConfig = {
  borderRadius: __typeV1sjik,
  backgroundColor: string,
  gap: string,
  padding: string,  // ⚪ loose — was `{ sm: { x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }; md: { x: Padding<number | (`
  border: string,  // ⚪ loose — was `{ disabled: { left: BorderLeft<number | (string & {})>; top: BorderTop<number | (string & {})>; bottom: Border`
  text: string,  // ⚪ loose — was `{ color: Color; fontWeight: FontWeight; fontSize: { sm: FontSize<number | (string & {})>; md: FontSize<number `
  iconSize: string,
}
type __typeSo6ld = {
  withQuickSelector: string,
  withoutQuickSelector: string,
}
type dateRangePickerCalendarTokenTypeTriggerDateInputConfig = {
  borderRadius: __typeSo6ld,
  padding: string,  // ⚪ loose — was `{ sm: { x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }; md: { x: Padding<number | (`
  text: string,  // ⚪ loose — was `{ color: Color; fontSize: { sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: Fo`
  border: string,  // ⚪ loose — was `{ disabled: Border<number | (string & {})>; active: Border<number | (string & {})>; default: Border<number | (`
  backgroundColor: string,
  iconSize: string,
  gap: string,
}
type dateRangePickerCalendarTokenTypeTriggerConfig = {
  quickSelector: dateRangePickerCalendarTokenTypeTriggerQuickSelectorConfig,
  dateInput: dateRangePickerCalendarTokenTypeTriggerDateInputConfig,
}
type __typeV1okzr = {
  x: string,
  y: string,
}
type __typeV1y6we2 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type __typeL5w9t = {
  gap: string,
  label: __typeV1y6we2,
}
type dateRangePickerCalendarTokenTypeCalendarHeaderConfig = {
  padding: __typeV1okzr,
  dateInput: __typeL5w9t,
}
type __typeMi4d5 = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: __typeV1okzr,
  gap: string,
}
type __typeYy6kg = {
  header: __typeMi4d5,
}
type __typeV17xsx2 = {
  gap: string,
}
type __typeYk8pw = {
  gap: string,
  fontSize: string,
  fontWeight: string,
  boxShadow: string,
  color: string,
  padding: __typeV1okzr,
  row: __typeV17xsx2,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridConfig = {
  month: __typeYy6kg,
  week: __typeYk8pw,
  day: string,  // ⚪ loose — was `{ cell: { padding: { x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }; fontWeight: Fo`
}
type dateRangePickerCalendarTokenTypeCalendarFooterConfig = {
  padding: __typeV1okzr,
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
module PresetsConfig = {
  type t
  external fromDateRangePreset: dateRangePreset => t = "%identity"
  external asDateRangePreset: t => (dateRangePreset) = "%identity"
  external fromCustomPresetConfig: customPresetConfig => t = "%identity"
  external asCustomPresetConfig: t => (customPresetConfig) = "%identity"
  external fromCustomPresetDefinition: customPresetDefinition => t = "%identity"
  external asCustomPresetDefinition: t => (customPresetDefinition) = "%identity"
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
type dateRangePickerPopoverConfig = {
  side?: dateRangePickerDateRangePickerPopoverConfigSide,
  align?: dateRangePickerDateRangePickerPopoverConfigAlign,
  sideOffset?: float,
}
type dateRangePickerProps = {
  value?: dateRange,
  onChange?: dateRange => unit,
  onPresetSelection?: presetSelectionData => unit,
  showDateTimePicker?: bool,
  showDateInput?: bool,
  showPresets?: bool,
  customPresets?: array<PresetsConfig.t>,
  placeholder?: string,
  isDisabled?: bool,
  icon?: React.element,
  minDate?: Date.t,
  maxDate?: Date.t,
  maxRangeDays?: float,
  dateFormat?: string,
  granularity?: dateRangePickerDateRangePickerPropsGranularity,
  allowSingleDateSelection?: bool,
  isSingleDatePicker?: bool,
  disableFutureDates?: bool,
  disablePastDates?: bool,
  hideFutureDates?: bool,
  hidePastDates?: bool,
  customDisableDates?: (Date.t, option<dateRange>) => bool,
  customRangeConfig?: customRangeConfig,
  triggerElement?: React.element,
  useDrawerOnMobile?: bool,
  skipQuickFiltersOnMobile?: bool,
  size?: dateRangePickerSize,
  formatConfig?: dateFormatConfig,
  triggerConfig?: triggerConfig,
  popoverConfig?: dateRangePickerPopoverConfig,
  maxMenuHeight?: float,
  showPreset?: bool,
  timezone?: string,
  maxYearOffset?: float,
}
