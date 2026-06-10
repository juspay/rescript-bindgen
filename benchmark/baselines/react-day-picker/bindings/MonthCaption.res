type props = {
  ...HtmlAttrs.htmlAttributes,
  calendarMonth: CjsClassesDateFnsLocaleTypesTypes.calendarMonth2,
  displayIndex: float,
}

@module("react-day-picker")
external make: React.component<props> = "MonthCaption"
