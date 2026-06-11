type props = {
  ...HtmlAttrs.htmlAttributes,
  day: LocaleSharedTypes.calendarDay2,
  modifiers: Dict.t<bool>,
}

@module("react-day-picker")
external make: React.component<props> = "Day"
