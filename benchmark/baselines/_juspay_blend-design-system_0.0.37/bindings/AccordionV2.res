type props = {
  ...AccordionV2Types.accordionV2Dimensions,
  children: React.element,
  accordionType?: AccordionV2Types.accordionV2Type,
  defaultValue?: CommonTypes.stringOrStringArray,
  value?: CommonTypes.stringOrStringArray,
  isMultiple?: bool,
  onValueChange?: CommonTypes.stringOrStringArray => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AccordionV2"
