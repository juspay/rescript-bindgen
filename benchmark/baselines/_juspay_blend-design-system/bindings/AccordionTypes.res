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
type gapConfig = {
  border: string,
  noBorder: string,
}
type borderConfig4 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type backgroundColorConfig5 = {
  border: borderConfig4,
  noBorder: borderConfig4,
}
type colorConfig4 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type titleConfig2 = {
  fontSize: string,
  fontWeight: string,
  color: colorConfig4,
}
type subtextConfig = {
  fontSize: string,
  gap: string,
  color: colorConfig4,
}
type textConfig10 = {
  title: titleConfig2,
  subtext: subtextConfig,
}
type slotConfig2 = {
  maxWidth: string,
}
type triggerConfig2 = {
  backgroundColor: backgroundColorConfig5,
  border: backgroundColorConfig5,
  padding: gapConfig,
  text: textConfig10,
  slot?: slotConfig2,
}
type separatorConfig = {
  color: gapConfig,
}
type accordionTokenType = {
  gap: gapConfig,
  borderRadius: gapConfig,
  trigger: triggerConfig2,
  separator: separatorConfig,
}
type responsiveAccordionTokens = {
  sm: accordionTokenType,
  lg: accordionTokenType,
}
