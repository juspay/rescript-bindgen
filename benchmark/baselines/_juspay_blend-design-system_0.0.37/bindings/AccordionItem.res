/** zero-cost wrapper: pass the FUNCTION form of `triggerSlot` — `triggerSlot={triggerSlotFn((…) => …)}` */
external triggerSlotFn: (AccordionTypes.slotRenderProps => React.element) => React.element = "%identity"

type props = {
  value: string,
  title: string,
  subtext?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  subtextSlot?: React.element,
  triggerSlot?: React.element,  // ⓘ function form: wrap with `triggerSlotFn` (zero-cost)
  triggerSlotWidth?: CommonTypes.stringOrNumber,
  children: React.element,
  isDisabled?: bool,
  chevronPosition?: AccordionTypes.accordionChevronPosition,
  accordionType?: AccordionTypes.accordionType,
  isFirst?: bool,
  isLast?: bool,
  isIntermediate?: bool,
  currentValue?: CommonTypes.stringOrStringArray,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AccordionItem"
