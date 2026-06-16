type noFillConfig2 = {
  neutral: string,
  primary: string,
  success: string,
  error: string,
  warning: string,
  purple: string,
}
type borderConfig11 = {
  noFill: noFillConfig2,
  attentive: noFillConfig2,
  subtle: noFillConfig2,
}
type xsConfig3 = {
  rounded: string,
  squarical: string,
}
type borderRadiusConfig13 = {
  xs: xsConfig3,
  sm: xsConfig3,
  md: xsConfig3,
  lg: xsConfig3,
}
type heightConfig5 = {
  xs: string,
  sm: string,
  md: string,
  lg: string,
}
type paddingConfig26 = {
  top: heightConfig5,
  bottom: heightConfig5,
  left: heightConfig5,
  right: heightConfig5,
}
type leftSlotConfig = {
  maxHeight: heightConfig5,
}
type textConfig27 = {
  color: borderConfig11,
  fontSize: heightConfig5,
  fontWeight: heightConfig5,
  lineHeight: heightConfig5,
}
type smConfig19 = {
  border: borderConfig11,
  borderRadius: borderRadiusConfig13,
  backgroundColor: borderConfig11,
  height: heightConfig5,
  padding: paddingConfig26,
  gap: string,
  leftSlot: leftSlotConfig,
  rightSlot: leftSlotConfig,
  text: textConfig27,
}
type responsiveTagV2Tokens = {
  sm: smConfig19,
  lg: smConfig19,
}
