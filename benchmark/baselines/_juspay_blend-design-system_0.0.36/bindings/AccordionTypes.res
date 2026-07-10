type accordionType =
  | @as("border") Border
  | @as("noBorder") NoBorder
type accordionChevronPosition =
  | @as("left") Left
  | @as("right") Right
type accordionProps = {
  children: React.element,
  accordionType?: accordionType,
  defaultValue?: CommonTypes.stringOrStringArray,
  value?: CommonTypes.stringOrStringArray,
  isMultiple?: bool,
  onValueChange?: CommonTypes.stringOrStringArray => unit,
}
type slotRenderProps = {
  isExpanded: bool,
  toggle: unit => unit,
  value: string,
  isDisabled: bool,
}
type accordionAccordionTokenTypeGapConfig = {
  border: string,
  noBorder: string,
}
type accordionAccordionTokenTypeTriggerBackgroundColorBorderConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionAccordionTokenTypeTriggerBackgroundColorConfig = {
  border: accordionAccordionTokenTypeTriggerBackgroundColorBorderConfig,
  noBorder: accordionAccordionTokenTypeTriggerBackgroundColorBorderConfig,
}
type accordionAccordionTokenTypeTriggerTextTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: accordionAccordionTokenTypeTriggerBackgroundColorBorderConfig,
}
type accordionAccordionTokenTypeTriggerTextSubtextConfig = {
  fontSize: string,
  gap: string,
  color: accordionAccordionTokenTypeTriggerBackgroundColorBorderConfig,
}
type accordionAccordionTokenTypeTriggerTextConfig = {
  title: accordionAccordionTokenTypeTriggerTextTitleConfig,
  subtext: accordionAccordionTokenTypeTriggerTextSubtextConfig,
}
type accordionAccordionTokenTypeTriggerSlotConfig = {
  maxWidth: string,
}
type accordionAccordionTokenTypeTriggerConfig = {
  backgroundColor: accordionAccordionTokenTypeTriggerBackgroundColorConfig,
  border: accordionAccordionTokenTypeTriggerBackgroundColorConfig,
  padding: accordionAccordionTokenTypeGapConfig,
  text: accordionAccordionTokenTypeTriggerTextConfig,
  slot?: accordionAccordionTokenTypeTriggerSlotConfig,
}
type accordionAccordionTokenTypeSeparatorConfig = {
  color: accordionAccordionTokenTypeGapConfig,
}
type accordionTokenType = {
  gap: accordionAccordionTokenTypeGapConfig,
  borderRadius: accordionAccordionTokenTypeGapConfig,
  trigger: accordionAccordionTokenTypeTriggerConfig,
  separator: accordionAccordionTokenTypeSeparatorConfig,
}
type responsiveAccordionTokens = {
  sm: accordionTokenType,
  lg: accordionTokenType,
}
