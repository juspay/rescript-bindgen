type props = {
  value: string,
  title: string,
  subtext?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  subtextSlot?: React.element,
  children: React.element,
  isDisabled?: bool,
  chevronPosition?: AccordionV2Types.accordionV2ChevronPosition,
  accordionType?: AccordionV2Types.accordionV2Type,
  isFirst?: bool,
  isLast?: bool,
  isIntermediate?: bool,
  currentValue?: CommonTypes.stringOrStringArray,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AccordionV2Item"
