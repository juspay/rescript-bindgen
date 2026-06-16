type gapConfig6 = {
  border: string,
  noBorder: string,
}
type contentConfig11 = {
  gap: string,
}
type borderConfig13 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type backgroundColorConfig22 = {
  border: borderConfig13,
  noBorder: borderConfig13,
}
type colorConfig20 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
  @as("open") open_: string,
}
type titleConfig10 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: colorConfig20,
}
type subtextConfig4 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  gap: string,
  color: colorConfig20,
}
type textConfig28 = {
  gap: string,
  title: titleConfig10,
  subtext: subtextConfig4,
}
type slotConfig7 = {
  height: string,
}
type triggerConfig7 = {
  content: contentConfig11,
  backgroundColor: backgroundColorConfig22,
  border: backgroundColorConfig22,
  padding: gapConfig6,
  text: textConfig28,
  slot: slotConfig7,
}
type separatorConfig3 = {
  color: gapConfig6,
}
type chevronConfig3 = {
  height: string,
  color: borderConfig13,
}
type accordionV2TokensType = {
  gap: gapConfig6,
  borderRadius: gapConfig6,
  trigger: triggerConfig7,
  separator: separatorConfig3,
  chevron: chevronConfig3,
}
type responsiveAccordionV2Tokens = {
  sm: accordionV2TokensType,
  lg: accordionV2TokensType,
}
