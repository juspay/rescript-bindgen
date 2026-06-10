type titleConfig7 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: AccordionTypes.colorConfig4,
}
type subtextConfig3 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  gap: string,
  color: AccordionTypes.colorConfig4,
}
type textConfig24 = {
  gap: string,
  title: titleConfig7,
  subtext: subtextConfig3,
}
type slotConfig6 = {
  height: string,
}
type triggerConfig7 = {
  content: ChartsTypes.slotsConfig,
  backgroundColor: AccordionTypes.backgroundColorConfig5,
  border: AccordionTypes.backgroundColorConfig5,
  padding: AccordionTypes.gapConfig,
  text: textConfig24,
  slot: slotConfig6,
}
type chevronConfig2 = {
  height: string,
  color: AccordionTypes.borderConfig4,
}
type accordionV2TokensType = {
  gap: AccordionTypes.gapConfig,
  borderRadius: AccordionTypes.gapConfig,
  trigger: triggerConfig7,
  separator: AccordionTypes.separatorConfig,
  chevron: chevronConfig2,
}
type responsiveAccordionV2Tokens = {
  sm: accordionV2TokensType,
  lg: accordionV2TokensType,
}
