type props = {
  ...HtmlAttrs.htmlAttributes,
  day: CjsClassesDateFnsLocaleTypesTypes.calendarDay2,
  modifiers: Dict.t<bool>,
}

@module("react-day-picker")
external make: React.component<props> = "Day"
