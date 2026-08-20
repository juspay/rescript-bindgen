type accordionType =
  | @as("border") Border
  | @as("noBorder") NoBorder
type accordionChevronPosition =
  | @as("left") Left
  | @as("right") Right
type accordionAccordionTokenTypeGapConfig = {
  border: string,
  noBorder: string,
}
type accordionUseThemeBorderConfig = {
  disabled: string,
  active: string,
  default: string,
  hover: string,
  @as("open") open_: string,
}
type accordionAccordionTokenTypeTriggerBackgroundColorConfig = {
  border: accordionUseThemeBorderConfig,
  noBorder: accordionUseThemeBorderConfig,
}
type accordionUseThemeTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: accordionUseThemeBorderConfig,
}
type accordionUseThemeSubtextConfig = {
  fontSize: string,
  gap: string,
  color: accordionUseThemeBorderConfig,
}
type accordionAccordionTokenTypeTriggerTextConfig = {
  title: accordionUseThemeTitleConfig,
  subtext: accordionUseThemeSubtextConfig,
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
