type props = {
  ...HtmlAttrs.buttonHTMLAttributes,
  day: CjsClassesDateFnsLocaleTypesTypes.calendarDay2,
  modifiers: Dict.t<bool>,
}

@module("react-day-picker")
external make: React.component<props> = "DayButton"
