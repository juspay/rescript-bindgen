type props = {
  ...HtmlAttrs.htmlAttributes,
  onPreviousClick?: ReactEvent.Mouse.t => unit,
  onNextClick?: ReactEvent.Mouse.t => unit,
  previousMonth?: Date.t,
  nextMonth?: Date.t,
}

@module("react-day-picker")
external make: React.component<props> = "Nav"
