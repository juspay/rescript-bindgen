type props = {
  ...HtmlAttrs.thHTMLAttributes,
  week: CjsClassesDateFnsLocaleTypesTypes.calendarWeek2,
}

@module("react-day-picker")
external make: React.component<props> = "WeekNumber"
