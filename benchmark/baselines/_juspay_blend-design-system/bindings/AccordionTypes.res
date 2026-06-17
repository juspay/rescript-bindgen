type accordionType =
  | @as("border") Border
  | @as("noBorder") NoBorder
type accordionChevronPosition =
  | @as("left") Left
  | @as("right") Right
type slotRenderProps = {
  isExpanded: bool,
  toggle: unit => unit,
  value: string,
  isDisabled: bool,
}
type accordionGapConfig = {
  border: string,
  noBorder: string,
}
type accordionBorderConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionBackgroundColorConfig = {
  border: accordionBorderConfig,
  noBorder: accordionBorderConfig,
}
type accordionColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: accordionColorConfig,
}
type accordionSubtextConfig = {
  fontSize: string,
  gap: string,
  color: accordionColorConfig,
}
type accordionTextConfig = {
  title: accordionTitleConfig,
  subtext: accordionSubtextConfig,
}
type accordionSlotConfig = {
  maxWidth: string,
}
type accordionTriggerConfig = {
  backgroundColor: accordionBackgroundColorConfig,
  border: accordionBackgroundColorConfig,
  padding: accordionGapConfig,
  text: accordionTextConfig,
  slot?: accordionSlotConfig,
}
type accordionSeparatorConfig = {
  color: accordionGapConfig,
}
type accordionTokenType = {
  gap: accordionGapConfig,
  borderRadius: accordionGapConfig,
  trigger: accordionTriggerConfig,
  separator: accordionSeparatorConfig,
}
type responsiveAccordionTokens = {
  sm: accordionTokenType,
  lg: accordionTokenType,
}
