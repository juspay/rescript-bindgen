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
type splitTagPosition =
  | @as("left") Left
  | @as("right") Right
type tagsPrimaryTagConfig = {
  color?: SplitTagTypes.color,
  left?: string,
  right?: string,
  justifyContent?: string,
  boxShadow?: string,
  width?: string,
  borderRadius?: string,
  letterSpacing?: string,
  fontSize?: string,
  lineHeight?: string,
  display?: string,
  fontWeight?: string,
  opacity?: string,
  height?: string,
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
  @as("as") as_?: SplitTagTypes.as_,
  _hover?: PrimitivesTypes.styledBlockProps,
  _focus?: PrimitivesTypes.styledBlockProps,
  _active?: PrimitivesTypes.styledBlockProps,
  _disabled?: PrimitivesTypes.styledBlockProps,
  _visited?: PrimitivesTypes.styledBlockProps,
  _focusVisible?: PrimitivesTypes.styledBlockProps,
  position?: string,
  pointerEvents?: string,
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
  overflow?: string,
  overflowX?: string,
  overflowY?: string,
  whiteSpace?: string,
  contentCentered?: bool,
  cursor?: string,
  textAlign?: string,
  textTransform?: string,
  textOverflow?: string,
  userSelect?: string,
  transform?: string,
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
type tagsResponsiveTagTokensSmBackgroundColorNoFillConfig = {
  neutral: string,
  primary: string,
  success: string,
  error: string,
  warning: string,
  purple: string,
}
type tagsResponsiveTagTokensSmBackgroundColorConfig = {
  noFill: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
  attentive: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
  subtle: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
}
type tagsResponsiveTagTokensSmBorderRadiusXsConfig = {
  rounded: string,
  squarical: string,
}
type tagsResponsiveTagTokensSmBorderRadiusConfig = {
  xs: tagsResponsiveTagTokensSmBorderRadiusXsConfig,
  sm: tagsResponsiveTagTokensSmBorderRadiusXsConfig,
  md: tagsResponsiveTagTokensSmBorderRadiusXsConfig,
  lg: tagsResponsiveTagTokensSmBorderRadiusXsConfig,
}
type tagsResponsiveTagTokensSmPaddingConfig = {
  xs: string,
  sm: string,
  md: string,
  lg: string,
}
type tagsResponsiveTagTokensSmTextConfig = {
  color: tagsResponsiveTagTokensSmBackgroundColorConfig,
  fontSize: tagsResponsiveTagTokensSmPaddingConfig,
  fontWeight: tagsResponsiveTagTokensSmPaddingConfig,
}
type tagsResponsiveTagTokensSmConfig = {
  minWidth: string,
  maxWidth: string,
  width: string,
  gap: string,
  backgroundColor: tagsResponsiveTagTokensSmBackgroundColorConfig,
  borderRadius: tagsResponsiveTagTokensSmBorderRadiusConfig,
  padding: tagsResponsiveTagTokensSmPaddingConfig,
  border: tagsResponsiveTagTokensSmBackgroundColorConfig,
  text: tagsResponsiveTagTokensSmTextConfig,
}
type responsiveTagTokens = {
  sm: tagsResponsiveTagTokensSmConfig,
  lg: tagsResponsiveTagTokensSmConfig,
}
