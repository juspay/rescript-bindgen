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
type dateRangePickerDateRangePickerPopoverConfigSide =
  | @as("top") Top
  | @as("left") Left
  | @as("bottom") Bottom
  | @as("right") Right
type dateRangePickerDateRangePickerPopoverConfigAlign =
  | @as("center") Center
  | @as("end") End
  | @as("start") Start
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
  md: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  lg: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig = {
  left: string,
  top: string,
  bottom: string,
  right: string,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderConfig = {
  disabled: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  active: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  default: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
  hover: dateRangePickerCalendarTokenTypeTriggerQuickSelectorBorderDisabledConfig,
}
type dateRangePickerCalendarTokenTypeTriggerQuickSelectorTextFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
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
  active: string,
  default: string,
  hover: string,
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
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
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
  padding: dateRangePickerCalendarTokenTypeTriggerQuickSelectorPaddingSmConfig,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
  border: dateRangePickerCalendarTokenTypeTriggerDateInputBorderConfig,
  borderRadius: string,
}
type __typeV12m5i = {
  topLeft: string,
  bottomLeft: string,
}
type __typeK75gz = {
  backgroundColor: string,
  borderRadius: __typeV12m5i,
}
type __typeV79lrl = {
  topRight: string,
  bottomRight: string,
}
type __typeV16sc8 = {
  backgroundColor: string,
  borderRadius: __typeV79lrl,
}
type __typeV1w9qo = {
  backgroundColor: string,
  borderRadius: string,
}
type __typeV139hr2 = {
  backgroundColor: string,
}
type __typeWviqp = {
  fontWeight: string,
}
type __typeV12ovp = {
  color: string,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayStatesConfig = {
  startDate: __typeK75gz,
  endDate: __typeV16sc8,
  singleDate: __typeV1w9qo,
  rangeDay: __typeV139hr2,
  todayDay: __typeWviqp,
  disabledDay: __typeV12ovp,
}
type dateRangePickerCalendarTokenTypeCalendarCalendarGridDayTextConfig = {
  dayNumber: __typeV12ovp,
  selectedDay: __typeV12ovp,
  rangeDay: __typeV12ovp,
  todayDay: __typeV12ovp,
  disabledDate: __typeV12ovp,
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
