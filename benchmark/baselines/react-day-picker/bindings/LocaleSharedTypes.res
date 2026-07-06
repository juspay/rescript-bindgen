@@warning("-30")

type formatDistanceToken =
  | @as("lessThanXSeconds") LessThanXSeconds
  | @as("xSeconds") XSeconds
  | @as("halfAMinute") HalfAMinute
  | @as("lessThanXMinutes") LessThanXMinutes
  | @as("xMinutes") XMinutes
  | @as("aboutXHours") AboutXHours
  | @as("xHours") XHours
  | @as("xDays") XDays
  | @as("aboutXWeeks") AboutXWeeks
  | @as("xWeeks") XWeeks
  | @as("aboutXMonths") AboutXMonths
  | @as("xMonths") XMonths
  | @as("aboutXYears") AboutXYears
  | @as("xYears") XYears
  | @as("overXYears") OverXYears
  | @as("almostXYears") AlmostXYears
type formatRelativeToken =
  | @as("lastWeek") LastWeek
  | @as("yesterday") Yesterday
  | @as("today") Today
  | @as("tomorrow") Tomorrow
  | @as("nextWeek") NextWeek
  | @as("other") Other
type localeWidth =
  | @as("narrow") Narrow
  | @as("short") Short
  | @as("abbreviated") Abbreviated
  | @as("wide") Wide
  | @as("any") Any
type classesLocalizeFnOptionsContext =
  | @as("formatting") Formatting
  | @as("standalone") Standalone
type localeUnit =
  | @as("second") Second
  | @as("minute") Minute
  | @as("hour") Hour
  | @as("day") Day
  | @as("dayOfYear") DayOfYear
  | @as("date") Date
  | @as("week") Week
  | @as("month") Month
  | @as("quarter") Quarter
  | @as("year") Year
type localeDayPeriod =
  | @as("am") Am
  | @as("pm") Pm
  | @as("midnight") Midnight
  | @as("noon") Noon
  | @as("morning") Morning
  | @as("afternoon") Afternoon
  | @as("evening") Evening
  | @as("night") Night
type formatLongWidth =
  | @as("short") Short
  | @as("any") Any
  | @as("full") Full
  | @as("long") Long
  | @as("medium") Medium
type numerals =
  | @as("latn") Latn
  | @as("arab") Arab
  | @as("arabext") Arabext
  | @as("deva") Deva
  | @as("geez") Geez
  | @as("beng") Beng
  | @as("guru") Guru
  | @as("gujr") Gujr
  | @as("orya") Orya
  | @as("tamldec") Tamldec
  | @as("telu") Telu
  | @as("knda") Knda
  | @as("mlym") Mlym
  | @as("thai") Thai
  | @as("mymr") Mymr
  | @as("khmr") Khmr
  | @as("laoo") Laoo
  | @as("tibt") Tibt
type monthYearOrder =
  | @as("month-first") MonthFirst
  | @as("year-first") YearFirst
type cjsMode =
  | @as("multiple") Multiple
  | @as("single") Single
  | @as("range") Range
type cjsCaptionLayout =
  | @as("label") Label
  | @as("dropdown") Dropdown
  | @as("dropdown-months") DropdownMonths
  | @as("dropdown-years") DropdownYears
type cjsNavLayout =
  | @as("around") Around
  | @as("after") After
type cjsDayPickerPropsRole =
  | @as("application") Application
  | @as("dialog") Dialog
type formatDistanceFnOptions = {
  addSuffix?: bool,
  comparison?: CommonTypes.v0OrV1OrV1,
}
type localeOptions = {
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
}
type localeFormatRelativeFnOptionsLocaleConfig = {
  options?: localeOptions,
  formatRelative: (string, string, string, option<string>) => string,  // ⚪ loose — was `FormatRelativeToken`
}
type formatRelativeFnOptions = {
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  locale?: localeFormatRelativeFnOptionsLocaleConfig,
}
type localizeFnOptions = {
  width?: localeWidth,
  context?: classesLocalizeFnOptionsContext,
  unit?: localeUnit,
}
type formatPart = {
  isToken: bool,
  value: string,
}
type localize = {
  ordinalNumber: (float, option<localizeFnOptions>) => string,
  era: (CommonTypes.v0OrV1, option<localizeFnOptions>) => string,
  quarter: (CommonTypes.v1OrV2OrV3OrV4, option<localizeFnOptions>) => string,
  month: (CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10OrV11, option<localizeFnOptions>) => string,
  day: (CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6, option<localizeFnOptions>) => string,
  dayPeriod: (localeDayPeriod, option<localizeFnOptions>) => string,
  preprocessor?: (string, array<formatPart>) => array<formatPart>,  // 🛑 BROKEN — contains `unknown`
}
type formatLongFnOptions = {
  width?: formatLongWidth,
}
type formatLong = {
  date: formatLongFnOptions => string,
  time: formatLongFnOptions => string,
  dateTime: formatLongFnOptions => string,
}
type matchFnResult = {
  value: float,
  rest: string,
}
type classesMatchOrdinalNumberConfig = {
  width?: localeWidth,
  valueCallback?: string => float,
  unit: localeUnit,
}
type matchFnResult2 = {
  value: CommonTypes.v0OrV1,
  rest: string,
}
type classesMatchEraConfig = {
  width?: localeWidth,
  valueCallback?: string => string,  // ⚪ loose — was `Era`
}
type matchFnResult3 = {
  value: CommonTypes.v1OrV2OrV3OrV4,
  rest: string,
}
type matchFnResult4 = {
  value: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10OrV11,
  rest: string,
}
type matchFnResult5 = {
  value: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  rest: string,
}
type matchFnResult6 = {
  value: localeDayPeriod,
  rest: string,
}
type match = {
  ordinalNumber: (string, option<classesMatchOrdinalNumberConfig>) => Nullable.t<matchFnResult>,
  era: (string, option<classesMatchEraConfig>) => Nullable.t<matchFnResult2>,
  quarter: (string, option<classesMatchEraConfig>) => Nullable.t<matchFnResult3>,
  month: (string, option<classesMatchEraConfig>) => Nullable.t<matchFnResult4>,
  day: (string, option<classesMatchEraConfig>) => Nullable.t<matchFnResult5>,
  dayPeriod: (string, option<classesMatchEraConfig>) => Nullable.t<matchFnResult6>,
}
type rec dayPickerLocaleLabels = {
  labelNav?: CommonTypes.classesDayPickerLocaleLabelsLabelNav,
  labelGrid?: dateLibOptionsLabelGrid,
  labelGridcell?: dateLibOptionsLabelGridcell,
  labelMonthDropdown?: dateLibOptionsLabelMonthDropdown,
  labelYearDropdown?: dateLibOptionsLabelYearDropdown,
  labelNext?: dateLibOptionsLabelNext,
  labelPrevious?: CommonTypes.classesDayPickerLocaleLabelsLabelPrevious,
  labelDayButton?: dateLibOptionsLabelDayButton,
  labelWeekday?: dateLibOptionsLabelWeekday,
  labelWeekNumber?: dateLibOptionsLabelWeekNumber,
  labelWeekNumberHeader?: dateLibOptionsLabelWeekNumberHeader,
}
and dayPickerLocale = {
  labels?: dayPickerLocaleLabels,
  code: string,
  formatDistance: (formatDistanceToken, float, option<formatDistanceFnOptions>) => string,
  formatRelative: (formatRelativeToken, string, string, option<formatRelativeFnOptions>) => string,  // 🛑 BROKEN — contains `unknown`
  localize: localize,
  formatLong: formatLong,
  match: match,
  options?: localeOptions,
}
and dateLibOptions = {
  @as("Date") date?: unit => string,
  locale?: dayPickerLocale,
  timeZone?: string,
  numerals?: numerals,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  useAdditionalWeekYearTokens?: bool,
  useAdditionalDayOfYearTokens?: bool,
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
@unboxed and dateLibOptionsLabelWeekNumberHeader = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and dateLibOptionsLabelWeekNumber = Str(string) | Fn((float, option<dateLibOptions>) => string)
@unboxed and dateLibOptionsLabelWeekday = Str(string) | Fn((Date.t, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and dateLibOptionsLabelDayButton = Str(string) | Fn((Date.t, Dict.t<bool>, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and dateLibOptionsLabelNext = Str(string) | Fn((Date.t, option<dateLibOptions>) => string)
@unboxed and dateLibOptionsLabelYearDropdown = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and dateLibOptionsLabelMonthDropdown = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and dateLibOptionsLabelGridcell = Str(string) | Fn((Date.t, option<Dict.t<bool>>, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and dateLibOptionsLabelGrid = Str(string) | Fn((Date.t, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
type interval = {
  start: string,  // ⚠️ REVIEW — was `DateArg<Date>` — match the real type by hand
  end: string,  // ⚠️ REVIEW — was `DateArg<Date>` — match the real type by hand
}
type localeEndOfWeekOptionsLocaleConfig = {
  options?: localeOptions,
}
type endOfWeekOptions = {
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  locale?: localeEndOfWeekOptionsLocaleConfig,
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
type localeFormatOptionsLocaleConfig = {
  options?: localeOptions,
  localize: localize,
  formatLong: formatLong,
}
type formatOptions = {
  locale?: localeFormatOptionsLocaleConfig,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  useAdditionalWeekYearTokens?: bool,
  useAdditionalDayOfYearTokens?: bool,
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
type getMonthOptions = {
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
type getWeekOptions = {
  locale?: localeEndOfWeekOptionsLocaleConfig,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
type startOfWeekOptions = {
  locale?: localeEndOfWeekOptionsLocaleConfig,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  @as("in") in_?: string => Date.t,  // ⚠️ REVIEW — was `string | number | Date` — match the real type by hand
}
type rec classesOverridesConfig = {
  options?: dateLibOptions,
  overrides?: classesOverridesConfig,
  formatNumber?: CommonTypes.stringOrNumber => string,
  getMonthYearOrder?: unit => monthYearOrder,
  formatMonthYear?: Date.t => string,
  today?: unit => Date.t,
  newDate?: (float, float, float) => Date.t,
  addDays?: (Date.t, float) => Date.t,
  addMonths?: (Date.t, float) => Date.t,
  addWeeks?: (Date.t, float) => Date.t,
  addYears?: (Date.t, float) => Date.t,
  differenceInCalendarDays?: (Date.t, Date.t) => float,
  differenceInCalendarMonths?: (Date.t, Date.t) => float,
  eachMonthOfInterval?: interval => array<Date.t>,
  eachYearOfInterval?: interval => array<Date.t>,
  endOfBroadcastWeek?: Date.t => Date.t,
  endOfISOWeek?: Date.t => Date.t,
  endOfMonth?: Date.t => Date.t,
  endOfWeek?: (Date.t, option<endOfWeekOptions>) => Date.t,
  endOfYear?: Date.t => Date.t,
  format?: (Date.t, string, option<formatOptions>) => string,
  getISOWeek?: Date.t => float,
  getMonth?: (Date.t, option<getMonthOptions>) => float,
  getYear?: (Date.t, option<getMonthOptions>) => float,
  getWeek?: (Date.t, option<getWeekOptions>) => float,
  isAfter?: (Date.t, Date.t) => bool,
  isBefore?: (Date.t, Date.t) => bool,
  isDate?: JSON.t => bool,
  isSameDay?: (Date.t, Date.t) => bool,
  isSameMonth?: (Date.t, Date.t) => bool,
  isSameYear?: (Date.t, Date.t) => bool,
  max?: array<Date.t> => Date.t,
  min?: array<Date.t> => Date.t,
  setMonth?: (Date.t, float) => Date.t,
  setYear?: (Date.t, float) => Date.t,
  startOfBroadcastWeek?: (Date.t, InstanceTypes.dateLib) => Date.t,
  startOfDay?: Date.t => Date.t,
  startOfISOWeek?: Date.t => Date.t,
  startOfMonth?: Date.t => Date.t,
  startOfWeek?: (Date.t, option<startOfWeekOptions>) => Date.t,
  startOfYear?: Date.t => Date.t,
}
type rec dateLib2 = {
  options: dateLibOptions,
  overrides?: classesOverridesConfig,
  getDigitMap: string,  // 🛑 BROKEN — contains `any`
  replaceDigits: string,  // 🛑 BROKEN — contains `any`
  formatNumber: CommonTypes.stringOrNumber => string,
  getMonthYearOrder: unit => monthYearOrder,
  formatMonthYear: Date.t => string,
  today: unit => Date.t,
  newDate: (float, float, float) => Date.t,
  addDays: (Date.t, float) => Date.t,
  addMonths: (Date.t, float) => Date.t,
  addWeeks: (Date.t, float) => Date.t,
  addYears: (Date.t, float) => Date.t,
  differenceInCalendarDays: (Date.t, Date.t) => float,
  differenceInCalendarMonths: (Date.t, Date.t) => float,
  eachMonthOfInterval: interval => array<Date.t>,
  eachYearOfInterval: interval => array<Date.t>,
  endOfBroadcastWeek: Date.t => Date.t,
  endOfISOWeek: Date.t => Date.t,
  endOfMonth: Date.t => Date.t,
  endOfWeek: (Date.t, option<endOfWeekOptions>) => Date.t,
  endOfYear: Date.t => Date.t,
  format: (Date.t, string, option<formatOptions>) => string,
  getISOWeek: Date.t => float,
  getMonth: (Date.t, option<getMonthOptions>) => float,
  getYear: (Date.t, option<getMonthOptions>) => float,
  getWeek: (Date.t, option<getWeekOptions>) => float,
  isAfter: (Date.t, Date.t) => bool,
  isBefore: (Date.t, Date.t) => bool,
  isDate: JSON.t => bool,
  isSameDay: (Date.t, Date.t) => bool,
  isSameMonth: (Date.t, Date.t) => bool,
  isSameYear: (Date.t, Date.t) => bool,
  max: array<Date.t> => Date.t,
  min: array<Date.t> => Date.t,
  setMonth: (Date.t, float) => Date.t,
  setYear: (Date.t, float) => Date.t,
  startOfBroadcastWeek: (Date.t, dateLib2) => Date.t,
  startOfDay: Date.t => Date.t,
  startOfISOWeek: Date.t => Date.t,
  startOfMonth: Date.t => Date.t,
  startOfWeek: (Date.t, option<startOfWeekOptions>) => Date.t,
  startOfYear: Date.t => Date.t,
}
type rec calendarDay2 = {
  dateLib: dateLib2,
  outside: bool,
  displayMonth: Date.t,
  date: Date.t,
  isoDate: string,
  displayMonthId: string,
  dateMonthId: string,
  isEqualTo: calendarDay2 => bool,
}
type calendarWeek2 = {
  weekNumber: float,
  days: array<calendarDay2>,
}
type calendarMonth2 = {
  date: Date.t,
  weeks: array<calendarWeek2>,
}
type typesClassNamesConfig = {
  root?: string,
  chevron?: string,
  day?: string,
  day_button?: string,
  caption_label?: string,
  dropdowns?: string,
  dropdown?: string,
  dropdown_root?: string,
  footer?: string,
  month_grid?: string,
  month_caption?: string,
  months_dropdown?: string,
  month?: string,
  months?: string,
  nav?: string,
  button_next?: string,
  button_previous?: string,
  week?: string,
  weeks?: string,
  weekday?: string,
  weekdays?: string,
  week_number?: string,
  week_number_header?: string,
  years_dropdown?: string,
  range_end?: string,
  range_middle?: string,
  range_start?: string,
  selected?: string,
  disabled?: string,
  hidden?: string,
  outside?: string,
  focused?: string,
  today?: string,
  weeks_before_enter?: string,
  weeks_before_exit?: string,
  weeks_after_enter?: string,
  weeks_after_exit?: string,
  caption_after_enter?: string,
  caption_after_exit?: string,
  caption_before_enter?: string,
  caption_before_exit?: string,
}
type typesStylesConfig = {
  root?: JsxDOM.style,
  chevron?: JsxDOM.style,
  day?: JsxDOM.style,
  day_button?: JsxDOM.style,
  caption_label?: JsxDOM.style,
  dropdowns?: JsxDOM.style,
  dropdown?: JsxDOM.style,
  dropdown_root?: JsxDOM.style,
  footer?: JsxDOM.style,
  month_grid?: JsxDOM.style,
  month_caption?: JsxDOM.style,
  months_dropdown?: JsxDOM.style,
  month?: JsxDOM.style,
  months?: JsxDOM.style,
  nav?: JsxDOM.style,
  button_next?: JsxDOM.style,
  button_previous?: JsxDOM.style,
  week?: JsxDOM.style,
  weeks?: JsxDOM.style,
  weekday?: JsxDOM.style,
  weekdays?: JsxDOM.style,
  week_number?: JsxDOM.style,
  week_number_header?: JsxDOM.style,
  years_dropdown?: JsxDOM.style,
  range_end?: JsxDOM.style,
  range_middle?: JsxDOM.style,
  range_start?: JsxDOM.style,
  selected?: JsxDOM.style,
  disabled?: JsxDOM.style,
  hidden?: JsxDOM.style,
  outside?: JsxDOM.style,
  focused?: JsxDOM.style,
  today?: JsxDOM.style,
}
type cjsComponentsDayConfig = {
  ...JsxDOM.domProps,
  day: calendarDay2,
  modifiers: Dict.t<bool>,
}
type cjsComponentsDropdownConfig = {
  ...JsxDOM.domProps,
  options?: array<ComponentsTypes.dropdownOption>,
}
type cjsComponentsMonthConfig = {
  ...JsxDOM.domProps,
  calendarMonth: calendarMonth2,
  displayIndex: float,
}
type cjsComponentsNavConfig = {
  ...JsxDOM.domProps,
  onPreviousClick?: ReactEvent.Mouse.t => unit,
  onNextClick?: ReactEvent.Mouse.t => unit,
  previousMonth?: Date.t,
  nextMonth?: Date.t,
}
type cjsComponentsRootConfig = {
  ...JsxDOM.domProps,
  rootRef?: React.ref<Nullable.t<Dom.element>>,
}
type cjsComponentsWeekConfig = {
  ...JsxDOM.domProps,
  week: calendarWeek2,
}
type typesComponentsConfig = {
  @as("Chevron") chevron?: ComponentsTypes.componentsComponentsChevronConfig => Dom.element,
  @as("CaptionLabel") captionLabel?: ReactTypes.htmlAttributes => Dom.element,
  @as("Day") day?: cjsComponentsDayConfig => Dom.element,
  @as("DayButton") dayButton?: cjsComponentsDayConfig => Dom.element,
  @as("Dropdown") dropdown?: cjsComponentsDropdownConfig => Dom.element,
  @as("DropdownNav") dropdownNav?: ReactTypes.htmlAttributes => Dom.element,
  @as("Footer") footer?: ReactTypes.htmlAttributes => Dom.element,
  @as("Month") month?: cjsComponentsMonthConfig => Dom.element,
  @as("MonthCaption") monthCaption?: cjsComponentsMonthConfig => Dom.element,
  @as("MonthGrid") monthGrid?: ReactTypes.htmlAttributes => Dom.element,
  @as("Months") months?: ReactTypes.htmlAttributes => Dom.element,
  @as("Nav") nav?: cjsComponentsNavConfig => Dom.element,
  @as("Option") option?: ReactTypes.htmlAttributes => Dom.element,
  @as("PreviousMonthButton") previousMonthButton?: ReactTypes.htmlAttributes => Dom.element,
  @as("NextMonthButton") nextMonthButton?: ReactTypes.htmlAttributes => Dom.element,
  @as("Root") root?: cjsComponentsRootConfig => Dom.element,
  @as("Select") select?: ReactTypes.htmlAttributes => Dom.element,
  @as("Weeks") weeks?: ReactTypes.htmlAttributes => Dom.element,
  @as("Week") week?: cjsComponentsWeekConfig => Dom.element,
  @as("Weekday") weekday?: ReactTypes.htmlAttributes => Dom.element,
  @as("Weekdays") weekdays?: ReactTypes.htmlAttributes => Dom.element,
  @as("WeekNumber") weekNumber?: cjsComponentsWeekConfig => Dom.element,
  @as("WeekNumberHeader") weekNumberHeader?: ReactTypes.htmlAttributes => Dom.element,
  @as("MonthsDropdown") monthsDropdown?: cjsComponentsDropdownConfig => Dom.element,
  @as("YearsDropdown") yearsDropdown?: cjsComponentsDropdownConfig => Dom.element,
}
type dateRange = {
  from?: Date.t,
  @as("to") to_?: Date.t,
}
type dateBefore = {
  before: Date.t,
}
type dateAfter = {
  after: Date.t,
}
type dateInterval = {
  before: Date.t,
  after: Date.t,
}
type dayOfWeek = {
  dayOfWeek: CommonTypes.numberOrNumberArray,
}
type typesLabelsConfig = {
  labelNav?: unit => string,
  labelGrid?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  labelGridcell?: (Date.t, option<Dict.t<bool>>, option<dateLibOptions>, option<dateLib2>) => string,
  labelMonthDropdown?: option<dateLibOptions> => string,
  labelYearDropdown?: option<dateLibOptions> => string,
  labelNext?: (Date.t, option<dateLibOptions>) => string,
  labelPrevious?: Date.t => string,
  labelDayButton?: (Date.t, Dict.t<bool>, option<dateLibOptions>, option<dateLib2>) => string,
  labelWeekday?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  labelWeekNumber?: (float, option<dateLibOptions>) => string,
  labelWeekNumberHeader?: option<dateLibOptions> => string,
}
type typesFormattersConfig = {
  formatCaption?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatDay?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatMonthDropdown?: (Date.t, option<dateLib2>) => string,
  formatWeekNumber?: (float, option<dateLib2>) => string,
  formatWeekNumberHeader?: unit => string,
  formatWeekdayName?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatYearDropdown?: (Date.t, option<dateLib2>) => string,
}
type classesLocaleConfig = {
  labels?: dayPickerLocaleLabels,
  code?: string,
  formatDistance?: (formatDistanceToken, float, option<formatDistanceFnOptions>) => string,
  formatRelative?: (formatRelativeToken, string, string, option<formatRelativeFnOptions>) => string,  // 🛑 BROKEN — contains `unknown`
  localize?: localize,
  formatLong?: formatLong,
  match?: match,
  options?: localeOptions,
}
type classNames = {
  root: string,
  chevron: string,
  day: string,
  day_button: string,
  caption_label: string,
  dropdowns: string,
  dropdown: string,
  dropdown_root: string,
  footer: string,
  month_grid: string,
  month_caption: string,
  months_dropdown: string,
  month: string,
  months: string,
  nav: string,
  button_next: string,
  button_previous: string,
  week: string,
  weeks: string,
  weekday: string,
  weekdays: string,
  week_number: string,
  week_number_header: string,
  years_dropdown: string,
  range_end: string,
  range_middle: string,
  range_start: string,
  selected: string,
  disabled: string,
  hidden: string,
  outside: string,
  focused: string,
  today: string,
  weeks_before_enter: string,
  weeks_before_exit: string,
  weeks_after_enter: string,
  weeks_after_exit: string,
  caption_after_enter: string,
  caption_after_exit: string,
  caption_before_enter: string,
  caption_before_exit: string,
}
module CjsDayPickerContextSelect = {
  type t
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
}
module CjsOnSelect = {
  type t
  external fromMouseEvent: ReactEvent.Mouse.t => t = "%identity"
  external fromKeyboardEvent: ReactEvent.Keyboard.t => t = "%identity"
}
type customComponents = {
  @as("Chevron") chevron: ComponentsTypes.componentsComponentsChevronConfig => Dom.element,
  @as("CaptionLabel") captionLabel: ReactTypes.htmlAttributes => Dom.element,
  @as("Day") day: cjsComponentsDayConfig => Dom.element,
  @as("DayButton") dayButton: cjsComponentsDayConfig => Dom.element,
  @as("Dropdown") dropdown: cjsComponentsDropdownConfig => Dom.element,
  @as("DropdownNav") dropdownNav: ReactTypes.htmlAttributes => Dom.element,
  @as("Footer") footer: ReactTypes.htmlAttributes => Dom.element,
  @as("Month") month: cjsComponentsMonthConfig => Dom.element,
  @as("MonthCaption") monthCaption: cjsComponentsMonthConfig => Dom.element,
  @as("MonthGrid") monthGrid: ReactTypes.htmlAttributes => Dom.element,
  @as("Months") months: ReactTypes.htmlAttributes => Dom.element,
  @as("Nav") nav: cjsComponentsNavConfig => Dom.element,
  @as("Option") option: ReactTypes.htmlAttributes => Dom.element,
  @as("PreviousMonthButton") previousMonthButton: ReactTypes.htmlAttributes => Dom.element,
  @as("NextMonthButton") nextMonthButton: ReactTypes.htmlAttributes => Dom.element,
  @as("Root") root: cjsComponentsRootConfig => Dom.element,
  @as("Select") select: ReactTypes.htmlAttributes => Dom.element,
  @as("Weeks") weeks: ReactTypes.htmlAttributes => Dom.element,
  @as("Week") week: cjsComponentsWeekConfig => Dom.element,
  @as("Weekday") weekday: ReactTypes.htmlAttributes => Dom.element,
  @as("Weekdays") weekdays: ReactTypes.htmlAttributes => Dom.element,
  @as("WeekNumber") weekNumber: cjsComponentsWeekConfig => Dom.element,
  @as("WeekNumberHeader") weekNumberHeader: ReactTypes.htmlAttributes => Dom.element,
  @as("MonthsDropdown") monthsDropdown: cjsComponentsDropdownConfig => Dom.element,
  @as("YearsDropdown") yearsDropdown: cjsComponentsDropdownConfig => Dom.element,
}
type labels = {
  labelNav: unit => string,
  labelGrid: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  labelGridcell: (Date.t, option<Dict.t<bool>>, option<dateLibOptions>, option<dateLib2>) => string,
  labelMonthDropdown: option<dateLibOptions> => string,
  labelYearDropdown: option<dateLibOptions> => string,
  labelNext: (Date.t, option<dateLibOptions>) => string,
  labelPrevious: Date.t => string,
  labelDayButton: (Date.t, Dict.t<bool>, option<dateLibOptions>, option<dateLib2>) => string,
  labelWeekday: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  labelWeekNumber: (float, option<dateLibOptions>) => string,
  labelWeekNumberHeader: option<dateLibOptions> => string,
}
type formatters = {
  formatCaption: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatDay: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatMonthDropdown: (Date.t, option<dateLib2>) => string,
  formatWeekNumber: (float, option<dateLib2>) => string,
  formatWeekNumberHeader: unit => string,
  formatWeekdayName: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatYearDropdown: (Date.t, option<dateLib2>) => string,
}
module Matcher = {
  type t
  external fromBool: bool => t = "%identity"
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromFn: (Date.t => bool) => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
  external fromDateBefore: dateBefore => t = "%identity"
  external fromDateAfter: dateAfter => t = "%identity"
  external fromDateInterval: dateInterval => t = "%identity"
  external fromDayOfWeek: dayOfWeek => t = "%identity"
}
module CjsDisabled = {
  type t
  external fromBool: bool => t = "%identity"
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromFn: (Date.t => bool) => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
  external fromDateBefore: dateBefore => t = "%identity"
  external fromDateAfter: dateAfter => t = "%identity"
  external fromDateInterval: dateInterval => t = "%identity"
  external fromDayOfWeek: dayOfWeek => t = "%identity"
  external fromMatchers: array<Matcher.t> => t = "%identity"
}
type dayPickerProps = {
  mode?: cjsMode,
  required?: bool,
  className?: string,
  classNames?: typesClassNamesConfig,
  modifiersClassNames?: Dict.t<string>,
  style?: JsxDOM.style,
  styles?: typesStylesConfig,
  modifiersStyles?: Dict.t<JsxDOM.style>,
  id?: string,
  defaultMonth?: Date.t,
  month?: Date.t,
  numberOfMonths?: float,
  startMonth?: Date.t,
  endMonth?: Date.t,
  pagedNavigation?: bool,
  reverseMonths?: bool,
  hideNavigation?: bool,
  disableNavigation?: bool,
  captionLayout?: cjsCaptionLayout,
  reverseYears?: bool,
  navLayout?: cjsNavLayout,
  fixedWeeks?: bool,
  hideWeekdays?: bool,
  showOutsideDays?: bool,
  showWeekNumber?: bool,
  animate?: bool,
  broadcastCalendar?: bool,
  @as("ISOWeek") iSOWeek?: bool,
  timeZone?: string,
  noonSafe?: bool,
  components?: typesComponentsConfig,
  footer?: React.element,
  autoFocus?: bool,
  disabled?: CjsDisabled.t,
  hidden?: CjsDisabled.t,
  today?: Date.t,
  modifiers?: Dict.t<CjsDisabled.t>,
  labels?: typesLabelsConfig,
  formatters?: typesFormattersConfig,
  dir?: string,
  @as("aria-label") ariaLabel?: string,
  @as("aria-labelledby") ariaLabelledby?: string,
  role?: cjsDayPickerPropsRole,
  nonce?: string,
  title?: string,
  lang?: string,
  locale?: classesLocaleConfig,
  numerals?: numerals,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  useAdditionalWeekYearTokens?: bool,
  useAdditionalDayOfYearTokens?: bool,
  onMonthChange?: Date.t => unit,
  onNextClick?: Date.t => unit,
  onPrevClick?: Date.t => unit,
  onDayClick?: (Date.t, Dict.t<bool>, ReactEvent.Mouse.t) => unit,
  onDayFocus?: (Date.t, Dict.t<bool>, ReactEvent.Focus.t) => unit,
  onDayBlur?: (Date.t, Dict.t<bool>, ReactEvent.Focus.t) => unit,
  onDayKeyDown?: (Date.t, Dict.t<bool>, ReactEvent.Keyboard.t) => unit,
  onDayMouseEnter?: (Date.t, Dict.t<bool>, ReactEvent.Mouse.t) => unit,
  onDayMouseLeave?: (Date.t, Dict.t<bool>, ReactEvent.Mouse.t) => unit,
  dateLib?: classesOverridesConfig,
}
type dayPickerContext = {
  months: array<calendarMonth2>,
  nextMonth?: Date.t,
  previousMonth?: Date.t,
  goToMonth: Date.t => unit,
  getModifiers: calendarDay2 => Dict.t<bool>,
  selected?: string,  // ⚪ loose — was `SelectedValue<T>`
  select?: (Date.t, Dict.t<bool>, CjsOnSelect.t) => CjsDayPickerContextSelect.t,
  isSelected?: Date.t => bool,
  components: customComponents,
  classNames: classNames,
  styles?: typesStylesConfig,
  labels: labels,
  formatters: formatters,
  dayPickerProps: dayPickerProps,
}
type dayPickerContext2 = {
  months: array<calendarMonth2>,
  nextMonth?: Date.t,
  previousMonth?: Date.t,
  goToMonth: Date.t => unit,
  getModifiers: calendarDay2 => Dict.t<bool>,
  selected?: string,  // ⚪ loose — was `undefined`
  select?: string,  // ⚪ loose — was `undefined`
  isSelected?: Date.t => bool,
  components: customComponents,
  classNames: classNames,
  styles?: typesStylesConfig,
  labels: labels,
  formatters: formatters,
  dayPickerProps: dayPickerProps,
}
