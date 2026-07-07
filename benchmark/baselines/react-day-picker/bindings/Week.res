type props = {
  ...HtmlAttrs.htmlAttributes,
  week: ClassesSharedTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "Week"
