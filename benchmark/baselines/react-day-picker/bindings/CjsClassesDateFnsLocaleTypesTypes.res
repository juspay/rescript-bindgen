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
type context =
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
type mode =
  | @as("multiple") Multiple
  | @as("single") Single
  | @as("range") Range
type captionLayout =
  | @as("label") Label
  | @as("dropdown") Dropdown
  | @as("dropdown-months") DropdownMonths
  | @as("dropdown-years") DropdownYears
type navLayout =
  | @as("around") Around
  | @as("after") After
type formatDistanceFnOptions = {
  addSuffix?: bool,
  comparison?: CommonTypes.v0OrV1OrV1,
}
type localeOptions = {
  weekStartsOn?: string,
  firstWeekContainsDate?: string,
}
type localeConfig = {
  options?: localeOptions,
  formatRelative: (string, string, string, option<string>) => string,
}
type formatRelativeFnOptions = {
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  locale?: localeConfig,
}
type localizeFnOptions = {
  width?: localeWidth,
  context?: context,
  unit?: localeUnit,
}
type formatPart = {
  isToken: string,
  value: string,
}
type localize = {
  ordinalNumber: (float, option<localizeFnOptions>) => string,
  era: (CommonTypes.v0OrV1, option<localizeFnOptions>) => string,
  quarter: (CommonTypes.v1OrV2OrV3OrV4, option<localizeFnOptions>) => string,
  month: (CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10OrV11, option<localizeFnOptions>) => string,
  day: (CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6, option<localizeFnOptions>) => string,
  dayPeriod: (localeDayPeriod, option<localizeFnOptions>) => string,
  preprocessor?: (string, array<formatPart>) => array<formatPart>,
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
type ordinalNumberConfig = {
  width?: localeWidth,
  valueCallback?: string => string,
  unit: localeUnit,
}
type matchFnResult2 = {
  value: CommonTypes.v0OrV1,
  rest: string,
}
type eraConfig = {
  width?: localeWidth,
  valueCallback?: string => string,
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
  ordinalNumber: (string, option<ordinalNumberConfig>) => matchFnResult,
  era: (string, option<eraConfig>) => matchFnResult2,
  quarter: (string, option<eraConfig>) => matchFnResult3,
  month: (string, option<eraConfig>) => matchFnResult4,
  day: (string, option<eraConfig>) => matchFnResult5,
  dayPeriod: (string, option<eraConfig>) => matchFnResult6,
}
type rec dayPickerLocaleLabels = {
  labelNav?: CommonTypes.labelNav,
  labelGrid?: labelGrid,
  labelGridcell?: labelGridcell,
  labelMonthDropdown?: labelMonthDropdown,
  labelYearDropdown?: labelYearDropdown,
  labelNext?: labelNext,
  labelPrevious?: CommonTypes.labelPrevious,
  labelDayButton?: labelDayButton,
  labelWeekday?: labelWeekday,
  labelWeekNumber?: labelWeekNumber,
  labelWeekNumberHeader?: labelWeekNumberHeader,
}
and dayPickerLocale = {
  labels?: dayPickerLocaleLabels,
  code: string,
  formatDistance: (formatDistanceToken, float, option<formatDistanceFnOptions>) => string,
  formatRelative: (formatRelativeToken, string, string, option<formatRelativeFnOptions>) => string,
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
  @as("in") in_?: string => Date.t,
}
@unboxed and labelWeekNumberHeader = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and labelWeekNumber = Str(string) | Fn((float, option<dateLibOptions>) => string)
@unboxed and labelWeekday = Str(string) | Fn((Date.t, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and labelDayButton = Str(string) | Fn((Date.t, Dict.t<bool>, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and labelNext = Str(string) | Fn((Date.t, option<dateLibOptions>) => string)
@unboxed and labelYearDropdown = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and labelMonthDropdown = Str(string) | Fn(option<dateLibOptions> => string)
@unboxed and labelGridcell = Str(string) | Fn((Date.t, option<Dict.t<bool>>, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
@unboxed and labelGrid = Str(string) | Fn((Date.t, option<dateLibOptions>, option<InstanceTypes.dateLib>) => string)
type interval = {
  start: string,
  end: string,
}
type localeConfig2 = {
  options?: localeOptions,
}
type endOfWeekOptions = {
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  locale?: localeConfig2,
  @as("in") in_?: string => Date.t,
}
type localeConfig3 = {
  options?: localeOptions,
  localize: localize,
  formatLong: formatLong,
}
type formatOptions = {
  locale?: localeConfig3,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  useAdditionalWeekYearTokens?: bool,
  useAdditionalDayOfYearTokens?: bool,
  @as("in") in_?: string => Date.t,
}
type getMonthOptions = {
  @as("in") in_?: string => Date.t,
}
type getWeekOptions = {
  locale?: localeConfig2,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  firstWeekContainsDate?: CommonTypes.v1OrV4,
  @as("in") in_?: string => Date.t,
}
type startOfWeekOptions = {
  locale?: localeConfig2,
  weekStartsOn?: CommonTypes.v0OrV1OrV2OrV3OrV4OrV5OrV6,
  @as("in") in_?: string => Date.t,
}
type rec overridesConfig = {
  options?: dateLibOptions,
  overrides?: overridesConfig,
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
  overrides?: overridesConfig,
  getDigitMap: string,
  replaceDigits: string,
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
type classNamesConfig = {
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
type stylesConfig = {
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
type dayConfig = {
  ...JsxDOM.domProps,
  day: calendarDay2,
  modifiers: Dict.t<bool>,
}
type dropdownConfig = {
  ...JsxDOM.domProps,
  options?: array<ComponentsTypes.dropdownOption>,
}
type monthConfig = {
  ...JsxDOM.domProps,
  calendarMonth: calendarMonth2,
  displayIndex: float,
}
type navConfig = {
  ...JsxDOM.domProps,
  onPreviousClick?: ReactEvent.Mouse.t => unit,
  onNextClick?: ReactEvent.Mouse.t => unit,
  previousMonth?: Date.t,
  nextMonth?: Date.t,
}
type rootConfig = {
  ...JsxDOM.domProps,
  rootRef?: React.ref<Nullable.t<Dom.element>>,
}
type weekConfig = {
  ...JsxDOM.domProps,
  week: calendarWeek2,
}
type componentsConfig = {
  @as("Chevron") chevron?: ComponentsTypes.chevronConfig => Dom.element,
  @as("CaptionLabel") captionLabel?: ReactTypes.htmlAttributes => Dom.element,
  @as("Day") day?: dayConfig => Dom.element,
  @as("DayButton") dayButton?: dayConfig => Dom.element,
  @as("Dropdown") dropdown?: dropdownConfig => Dom.element,
  @as("DropdownNav") dropdownNav?: ReactTypes.htmlAttributes => Dom.element,
  @as("Footer") footer?: ReactTypes.htmlAttributes => Dom.element,
  @as("Month") month?: monthConfig => Dom.element,
  @as("MonthCaption") monthCaption?: monthConfig => Dom.element,
  @as("MonthGrid") monthGrid?: ReactTypes.htmlAttributes => Dom.element,
  @as("Months") months?: ReactTypes.htmlAttributes => Dom.element,
  @as("Nav") nav?: navConfig => Dom.element,
  @as("Option") option?: ReactTypes.htmlAttributes => Dom.element,
  @as("PreviousMonthButton") previousMonthButton?: ReactTypes.htmlAttributes => Dom.element,
  @as("NextMonthButton") nextMonthButton?: ReactTypes.htmlAttributes => Dom.element,
  @as("Root") root?: rootConfig => Dom.element,
  @as("Select") select?: ReactTypes.htmlAttributes => Dom.element,
  @as("Weeks") weeks?: ReactTypes.htmlAttributes => Dom.element,
  @as("Week") week?: weekConfig => Dom.element,
  @as("Weekday") weekday?: ReactTypes.htmlAttributes => Dom.element,
  @as("Weekdays") weekdays?: ReactTypes.htmlAttributes => Dom.element,
  @as("WeekNumber") weekNumber?: weekConfig => Dom.element,
  @as("WeekNumberHeader") weekNumberHeader?: ReactTypes.htmlAttributes => Dom.element,
  @as("MonthsDropdown") monthsDropdown?: dropdownConfig => Dom.element,
  @as("YearsDropdown") yearsDropdown?: dropdownConfig => Dom.element,
}
type dateRange = {
  from: Date.t,
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
type labelsConfig = {
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
type formattersConfig = {
  formatCaption?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatDay?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatMonthDropdown?: (Date.t, option<dateLib2>) => string,
  formatWeekNumber?: (float, option<dateLib2>) => string,
  formatWeekNumberHeader?: unit => string,
  formatWeekdayName?: (Date.t, option<dateLibOptions>, option<dateLib2>) => string,
  formatYearDropdown?: (Date.t, option<dateLib2>) => string,
}
type localeConfig4 = {
  labels?: dayPickerLocaleLabels,
  code?: string,
  formatDistance?: (formatDistanceToken, float, option<formatDistanceFnOptions>) => string,
  formatRelative?: (formatRelativeToken, string, string, option<formatRelativeFnOptions>) => string,
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
module Select = {
  type t
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
}
type customComponents = {
  @as("Chevron") chevron: ComponentsTypes.chevronConfig => Dom.element,
  @as("CaptionLabel") captionLabel: ReactTypes.htmlAttributes => Dom.element,
  @as("Day") day: dayConfig => Dom.element,
  @as("DayButton") dayButton: dayConfig => Dom.element,
  @as("Dropdown") dropdown: dropdownConfig => Dom.element,
  @as("DropdownNav") dropdownNav: ReactTypes.htmlAttributes => Dom.element,
  @as("Footer") footer: ReactTypes.htmlAttributes => Dom.element,
  @as("Month") month: monthConfig => Dom.element,
  @as("MonthCaption") monthCaption: monthConfig => Dom.element,
  @as("MonthGrid") monthGrid: ReactTypes.htmlAttributes => Dom.element,
  @as("Months") months: ReactTypes.htmlAttributes => Dom.element,
  @as("Nav") nav: navConfig => Dom.element,
  @as("Option") option: ReactTypes.htmlAttributes => Dom.element,
  @as("PreviousMonthButton") previousMonthButton: ReactTypes.htmlAttributes => Dom.element,
  @as("NextMonthButton") nextMonthButton: ReactTypes.htmlAttributes => Dom.element,
  @as("Root") root: rootConfig => Dom.element,
  @as("Select") select: ReactTypes.htmlAttributes => Dom.element,
  @as("Weeks") weeks: ReactTypes.htmlAttributes => Dom.element,
  @as("Week") week: weekConfig => Dom.element,
  @as("Weekday") weekday: ReactTypes.htmlAttributes => Dom.element,
  @as("Weekdays") weekdays: ReactTypes.htmlAttributes => Dom.element,
  @as("WeekNumber") weekNumber: weekConfig => Dom.element,
  @as("WeekNumberHeader") weekNumberHeader: ReactTypes.htmlAttributes => Dom.element,
  @as("MonthsDropdown") monthsDropdown: dropdownConfig => Dom.element,
  @as("YearsDropdown") yearsDropdown: dropdownConfig => Dom.element,
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
type dayPickerContext = {
  months: array<calendarMonth2>,
  nextMonth: Date.t,
  previousMonth: Date.t,
  goToMonth: Date.t => unit,
  getModifiers: calendarDay2 => Dict.t<bool>,
  selected: string,
  select: (Date.t, Dict.t<bool>, string) => Select.t,
  isSelected: Date.t => bool,
  components: customComponents,
  classNames: classNames,
  styles: stylesConfig,
  labels: labels,
  formatters: formatters,
  dayPickerProps: string,
}
type dayPickerContext2 = {
  months: array<calendarMonth2>,
  nextMonth: Date.t,
  previousMonth: Date.t,
  goToMonth: Date.t => unit,
  getModifiers: calendarDay2 => Dict.t<bool>,
  selected: string,
  select: string,
  isSelected: Date.t => bool,
  components: customComponents,
  classNames: classNames,
  styles: stylesConfig,
  labels: labels,
  formatters: formatters,
  dayPickerProps: string,
}
module Matcher = {
  type t
  external fromBoolean: bool => t = "%identity"
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromType: (Date.t => bool) => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
  external fromDateBefore: dateBefore => t = "%identity"
  external fromDateAfter: dateAfter => t = "%identity"
  external fromDateInterval: dateInterval => t = "%identity"
  external fromDayOfWeek: dayOfWeek => t = "%identity"
}
module Disabled = {
  type t
  external fromBoolean: bool => t = "%identity"
  external fromDate: Date.t => t = "%identity"
  external fromDates: array<Date.t> => t = "%identity"
  external fromType: (Date.t => bool) => t = "%identity"
  external fromDateRange: dateRange => t = "%identity"
  external fromDateBefore: dateBefore => t = "%identity"
  external fromDateAfter: dateAfter => t = "%identity"
  external fromDateInterval: dateInterval => t = "%identity"
  external fromDayOfWeek: dayOfWeek => t = "%identity"
  external fromMatchers: array<Matcher.t> => t = "%identity"
}
