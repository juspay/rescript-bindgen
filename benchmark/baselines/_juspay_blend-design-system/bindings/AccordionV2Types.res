type accordionV2GapConfig = {
  border: string,
  noBorder: string,
}
type accordionV2ContentConfig = {
  gap: string,
}
type accordionV2BorderConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionV2BackgroundColorConfig = {
  border: accordionV2BorderConfig,
  noBorder: accordionV2BorderConfig,
}
type accordionV2ColorConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type accordionV2TitleConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: accordionV2ColorConfig,
}
type accordionV2SubtextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  gap: string,
  color: accordionV2ColorConfig,
}
type accordionV2TextConfig = {
  gap: string,
  title: accordionV2TitleConfig,
  subtext: accordionV2SubtextConfig,
}
type accordionV2SlotConfig = {
  height: string,
}
type accordionV2TriggerConfig = {
  content: accordionV2ContentConfig,
  backgroundColor: accordionV2BackgroundColorConfig,
  border: accordionV2BackgroundColorConfig,
  padding: accordionV2GapConfig,
  text: accordionV2TextConfig,
  slot: accordionV2SlotConfig,
}
type accordionV2SeparatorConfig = {
  color: accordionV2GapConfig,
}
type accordionV2ChevronConfig = {
  height: string,
  color: accordionV2BorderConfig,
}
type accordionV2TokensType = {
  gap: accordionV2GapConfig,
  borderRadius: accordionV2GapConfig,
  trigger: accordionV2TriggerConfig,
  separator: accordionV2SeparatorConfig,
  chevron: accordionV2ChevronConfig,
}
type responsiveAccordionV2Tokens = {
  sm: accordionV2TokensType,
  lg: accordionV2TokensType,
}
