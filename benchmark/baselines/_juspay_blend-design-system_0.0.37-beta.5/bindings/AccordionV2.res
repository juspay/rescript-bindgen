@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~accordionType: AccordionV2Types.accordionV2Type=?,
  ~defaultValue: CommonTypes.stringOrStringArray=?,
  ~value: CommonTypes.stringOrStringArray=?,
  ~isMultiple: bool=?,
  ~onValueChange: CommonTypes.stringOrStringArray => unit=?,
  ~width: string=?,
  ~maxWidth: string=?,
  ~minWidth: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "AccordionV2"
