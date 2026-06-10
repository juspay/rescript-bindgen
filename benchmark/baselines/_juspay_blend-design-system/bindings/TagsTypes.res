type tagVariant =
  | @as("noFill") NoFill
  | @as("attentive") Attentive
  | @as("subtle") Subtle
type tagSize =
  | @as("xs") Xs
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type tagShape =
  | @as("rounded") Rounded
  | @as("squarical") Squarical
type size =
  | @as("xs") Xs
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type as_ =
  | @as("div") Div
  | @as("label") Label
  | @as("nav") Nav
  | @as("span") Span
  | @as("article") Article
  | @as("footer") Footer
  | @as("header") Header
  | @as("hr") Hr
  | @as("main") Main
  | @as("section") Section
type splitTagPosition =
  | @as("left") Left
  | @as("right") Right
type primaryTagConfig = {
  ...JsxDOM.domProps,
  color?: SplitTagTypes.color,
  left?: string,
  right?: string,
  justifyContent?: string,
  boxShadow?: string,
  borderRadius?: string,
  lineHeight?: string,
  gap?: string,
  padding?: CommonTypes.stringOrNumber,
  margin?: CommonTypes.stringOrNumber,
  zIndex?: string,
  maxHeight?: string,
  bottom?: string,
  top?: string,
  border?: string,
  inset?: string,
  outline?: string,
  text: string,
  backgroundColor?: string,
  paddingTop?: CommonTypes.stringOrNumber,
  paddingRight?: CommonTypes.stringOrNumber,
  paddingBottom?: CommonTypes.stringOrNumber,
  paddingLeft?: CommonTypes.stringOrNumber,
  borderBottom?: string,
  _hover?: PrimitivesTypes.styledBlockProps,
  _focus?: PrimitivesTypes.styledBlockProps,
  _active?: PrimitivesTypes.styledBlockProps,
  _disabled?: PrimitivesTypes.styledBlockProps,
  _visited?: PrimitivesTypes.styledBlockProps,
  _focusVisible?: PrimitivesTypes.styledBlockProps,
  position?: string,
  paddingX?: CommonTypes.stringOrNumber,
  paddingY?: CommonTypes.stringOrNumber,
  marginTop?: CommonTypes.stringOrNumber,
  marginBottom?: CommonTypes.stringOrNumber,
  marginLeft?: CommonTypes.stringOrNumber,
  marginRight?: CommonTypes.stringOrNumber,
  marginX?: CommonTypes.stringOrNumber,
  marginY?: CommonTypes.stringOrNumber,
  flexDirection?: string,
  alignItems?: string,
  flexWrap?: string,
  flexGrow?: string,
  flexShrink?: string,
  flexBasis?: string,
  rowGap?: string,
  columnGap?: string,
  alignContent?: string,
  alignSelf?: string,
  justifySelf?: string,
  borderTopLeftRadius?: string,
  borderTopRightRadius?: string,
  borderBottomLeftRadius?: string,
  borderBottomRightRadius?: string,
  outlineColor?: string,
  outlineWidth?: string,
  outlineStyle?: string,
  outlineOffset?: string,
  minWidth?: string,
  minHeight?: string,
  maxWidth?: string,
  backgroundImage?: string,
  backgroundSize?: string,
  borderTop?: string,
  borderLeft?: string,
  borderRight?: string,
  whiteSpace?: string,
  contentCentered?: bool,
  textAlign?: string,
  textTransform?: string,
  textOverflow?: string,
  userSelect?: string,
  willChange?: string,
  transformOrigin?: string,
  backfaceVisibility?: string,
  transition?: string,
  transitionDuration?: string,
  transitionTimingFunction?: string,
  transitionDelay?: string,
  variant?: tagVariant,
  leftSlot?: React.element,
  rightSlot?: React.element,
}
type noFillConfig = {
  neutral: string,
  primary: string,
  success: string,
  error: string,
  warning: string,
  purple: string,
}
type backgroundColorConfig3 = {
  noFill: noFillConfig,
  attentive: noFillConfig,
  subtle: noFillConfig,
}
type xsConfig2 = {
  rounded: string,
  squarical: string,
}
type borderRadiusConfig3 = {
  xs: xsConfig2,
  sm: xsConfig2,
  md: xsConfig2,
  lg: xsConfig2,
}
type paddingConfig4 = {
  xs: string,
  sm: string,
  md: string,
  lg: string,
}
type textConfig4 = {
  color: backgroundColorConfig3,
  fontSize: paddingConfig4,
  fontWeight: paddingConfig4,
}
type smConfig3 = {
  minWidth: string,
  maxWidth: string,
  width: string,
  gap: string,
  backgroundColor: backgroundColorConfig3,
  borderRadius: borderRadiusConfig3,
  padding: paddingConfig4,
  border: backgroundColorConfig3,
  text: textConfig4,
}
type responsiveTagTokens = {
  sm: smConfig3,
  lg: smConfig3,
}
