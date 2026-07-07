type props = {
  ...HtmlAttrs.thHTMLAttributes,
  week: ClassesSharedTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "WeekNumber"
