type props = {
  ...HtmlAttrs.htmlAttributes,
  week: LocaleSharedTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "Week"
