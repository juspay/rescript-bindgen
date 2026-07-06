@module("@juspay/blend-design-system") @react.component
external make: (
  ~isExpanded: bool,
  ~isDisabled: bool,
  ~position: AccordionV2Types.accordionV2ChevronPosition,
  ~accordionTokens: AccordionV2Types.accordionV2TokensType,
) => React.element = "AccordionV2Chevron"
