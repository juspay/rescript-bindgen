type props = {
  ...HtmlAttrs.htmlAttributes,
  calendarMonth: LocaleSharedTypes.calendarMonth2,
  displayIndex: float,
}

@module("react-day-picker")
external make: React.component<props> = "MonthCaption"
