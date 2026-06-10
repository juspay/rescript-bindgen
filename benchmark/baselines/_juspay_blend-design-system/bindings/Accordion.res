@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~accordionType: AccordionTypes.accordionType=?,
  ~defaultValue: CommonTypes.stringOrStringArray=?,
  ~value: CommonTypes.stringOrStringArray=?,
  ~isMultiple: bool=?,
  ~onValueChange: CommonTypes.stringOrStringArray => unit=?,
) => React.element = "Accordion"
