@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~accordionType: AccordionTypes.accordionType=?,
  ~defaultValue: CommonTypes.stringOrStringArray=?,
  ~value: CommonTypes.stringOrStringArray=?,
  ~isMultiple: bool=?,
  ~onValueChange: CommonTypes.stringOrStringArray => unit=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Accordion"
