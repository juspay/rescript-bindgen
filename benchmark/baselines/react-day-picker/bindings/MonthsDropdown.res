type props = {
  ...HtmlAttrs.selectHTMLAttributesOmitChildren,
  options?: array<ComponentsTypes.dropdownOption>,
}

@module("react-day-picker")
external make: React.component<props> = "MonthsDropdown"
