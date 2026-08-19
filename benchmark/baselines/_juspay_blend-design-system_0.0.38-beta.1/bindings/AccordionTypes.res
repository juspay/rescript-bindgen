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
type accordionAccordionTokenTypeTriggerBackgroundColorConfig = {
  border: string,  // ⚪ loose — was `{ disabled: BackgroundColor; active: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; open: `
  noBorder: string,  // ⚪ loose — was `{ disabled: BackgroundColor; active: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; open: `
}
type accordionAccordionTokenTypeTriggerTextConfig = {
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: { disabled: Color; active: Color;`
  subtext: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; gap: Gap<number | (string & {})>; color: { disabled: Color; acti`
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
