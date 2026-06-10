type props = {
  ...HtmlAttrs.tableHTMLAttributes,
}

@module("react-day-picker")
external make: React.component<props> = "MonthGrid"
