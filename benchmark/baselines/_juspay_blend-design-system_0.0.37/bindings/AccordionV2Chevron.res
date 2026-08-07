type props = {
  isExpanded: bool,
  isDisabled: bool,
  position: AccordionV2Types.accordionV2ChevronPosition,
  accordionTokens: AccordionV2Types.accordionV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AccordionV2Chevron"
