@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~accordionType: AccordionV2Types.accordionV2Type=?,
  ~defaultValue: HighchartsSharedTypes.stringOrStringArray=?,
  ~value: HighchartsSharedTypes.stringOrStringArray=?,
  ~isMultiple: bool=?,
  ~onValueChange: HighchartsSharedTypes.stringOrStringArray => unit=?,
  ~width: string=?,
  ~maxWidth: string=?,
  ~minWidth: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "AccordionV2"
