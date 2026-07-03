type accordionV2AccordionV2TokensTypeGapConfig = {
  border: string,
  noBorder: string,
}
type accordionV2AccordionV2TokensTypeTriggerContentConfig = {
  gap: string,
}
type accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionV2AccordionV2TokensTypeTriggerBackgroundColorConfig = {
  border: accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig,
  noBorder: accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig,
}
type accordionV2AccordionV2TokensTypeTriggerTextTitleConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig,
}
type accordionV2AccordionV2TokensTypeTriggerTextSubtextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  gap: string,
  color: accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig,
}
type accordionV2AccordionV2TokensTypeTriggerTextConfig = {
  gap: string,
  title: accordionV2AccordionV2TokensTypeTriggerTextTitleConfig,
  subtext: accordionV2AccordionV2TokensTypeTriggerTextSubtextConfig,
}
type accordionV2AccordionV2TokensTypeTriggerSlotConfig = {
  height: string,
}
type accordionV2AccordionV2TokensTypeTriggerConfig = {
  content: accordionV2AccordionV2TokensTypeTriggerContentConfig,
  backgroundColor: accordionV2AccordionV2TokensTypeTriggerBackgroundColorConfig,
  border: accordionV2AccordionV2TokensTypeTriggerBackgroundColorConfig,
  padding: accordionV2AccordionV2TokensTypeGapConfig,
  text: accordionV2AccordionV2TokensTypeTriggerTextConfig,
  slot: accordionV2AccordionV2TokensTypeTriggerSlotConfig,
}
type accordionV2AccordionV2TokensTypeSeparatorConfig = {
  color: accordionV2AccordionV2TokensTypeGapConfig,
}
type accordionV2AccordionV2TokensTypeChevronConfig = {
  height: string,
  color: accordionV2AccordionV2TokensTypeTriggerBackgroundColorBorderConfig,
}
type accordionV2TokensType = {
  gap: accordionV2AccordionV2TokensTypeGapConfig,
  borderRadius: accordionV2AccordionV2TokensTypeGapConfig,
  trigger: accordionV2AccordionV2TokensTypeTriggerConfig,
  separator: accordionV2AccordionV2TokensTypeSeparatorConfig,
  chevron: accordionV2AccordionV2TokensTypeChevronConfig,
}
type responsiveAccordionV2Tokens = {
  sm: accordionV2TokensType,
  lg: accordionV2TokensType,
}
