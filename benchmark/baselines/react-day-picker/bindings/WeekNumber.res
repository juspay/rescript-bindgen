type props = {
  ...HtmlAttrs.thHTMLAttributes,
  week: LocaleSharedTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "WeekNumber"
