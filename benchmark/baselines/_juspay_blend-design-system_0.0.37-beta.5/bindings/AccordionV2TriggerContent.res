@module("@juspay/blend-design-system") @react.component
external make: (
  ~title: string,
  ~subtext: string=?,
  ~leftSlot: React.element=?,
  ~rightSlot: React.element=?,
  ~subtextSlot: React.element=?,
  ~isDisabled: bool,
  ~isExpanded: bool,
  ~chevronPosition: AccordionV2Types.accordionV2ChevronPosition,
  ~accordionTokens: AccordionV2Types.accordionV2TokensType,
  ~isSmallScreen: bool,
) => React.element = "AccordionV2TriggerContent"
