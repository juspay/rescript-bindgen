type props = {
  ...HtmlAttrs.htmlAttributes,
  week: CjsClassesDateFnsLocaleTypesTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "Week"
