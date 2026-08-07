type props = {
  title: string,
  subtext?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  subtextSlot?: React.element,
  isDisabled: bool,
  isExpanded: bool,
  chevronPosition: AccordionV2Types.accordionV2ChevronPosition,
  accordionTokens: AccordionV2Types.accordionV2TokensType,
  isSmallScreen: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AccordionV2TriggerContent"
