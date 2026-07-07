@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~accordionType: AccordionTypes.accordionType=?,
  ~defaultValue: HighchartsSharedTypes.stringOrStringArray=?,
  ~value: HighchartsSharedTypes.stringOrStringArray=?,
  ~isMultiple: bool=?,
  ~onValueChange: HighchartsSharedTypes.stringOrStringArray => unit=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Accordion"
