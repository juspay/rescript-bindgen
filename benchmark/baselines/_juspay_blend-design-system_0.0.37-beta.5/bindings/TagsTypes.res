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
type tagsSize =
  | @as("xs") Xs
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
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
type tagsPrimaryTagConfig = {
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  gap?: string,
  backgroundColor?: string,
  borderRadius?: string,
  padding?: HighchartsSharedTypes.stringOrNumber,
  border?: string,
  text: string,
  inset?: string,
  color?: SplitTagTypes.splitTagPrimaryTagColor,
  fontSize?: string,
  fontWeight?: string,
  borderBottom?: string,
  outline?: string,
  boxShadow?: string,
  lineHeight?: string,
  transition?: string,
  height?: string,
  top?: string,
  left?: string,
  outlineOffset?: string,
  marginLeft?: HighchartsSharedTypes.stringOrNumber,
  paddingTop?: HighchartsSharedTypes.stringOrNumber,
  paddingRight?: HighchartsSharedTypes.stringOrNumber,
  paddingBottom?: HighchartsSharedTypes.stringOrNumber,
  paddingLeft?: HighchartsSharedTypes.stringOrNumber,
  maxHeight?: string,
  bottom?: string,
  right?: string,
  zIndex?: string,
  margin?: HighchartsSharedTypes.stringOrNumber,
  marginTop?: HighchartsSharedTypes.stringOrNumber,
  marginRight?: HighchartsSharedTypes.stringOrNumber,
  marginBottom?: HighchartsSharedTypes.stringOrNumber,
  display?: string,
  flexDirection?: string,
  position?: string,
  justifyContent?: string,
  alignItems?: string,
  overflowX?: string,
  overflowY?: string,
  flexShrink?: string,
  minHeight?: string,
  transform?: string,
  textAlign?: string,
  cursor?: string,
  userSelect?: string,
  textTransform?: string,
  borderTop?: string,
  borderTopLeftRadius?: string,
  borderTopRightRadius?: string,
  borderBottomLeftRadius?: string,
  borderBottomRightRadius?: string,
  borderLeft?: string,
  borderRight?: string,
  backgroundSize?: string,
  backgroundImage?: string,
  letterSpacing?: string,
  opacity?: string,
  overflow?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  pointerEvents?: string,
  textOverflow?: string,
  whiteSpace?: string,
  @as("as") as_?: SkeletonTypes.skeletonAs,
  _hover?: PrimitivesTypes.styledBlockProps,
  _focus?: PrimitivesTypes.styledBlockProps,
  _active?: PrimitivesTypes.styledBlockProps,
  _disabled?: PrimitivesTypes.styledBlockProps,
  _visited?: PrimitivesTypes.styledBlockProps,
  _focusVisible?: PrimitivesTypes.styledBlockProps,
  paddingX?: HighchartsSharedTypes.stringOrNumber,
  paddingY?: HighchartsSharedTypes.stringOrNumber,
  marginX?: HighchartsSharedTypes.stringOrNumber,
  marginY?: HighchartsSharedTypes.stringOrNumber,
  flexWrap?: string,
  flexGrow?: string,
  flexBasis?: string,
  rowGap?: string,
  columnGap?: string,
  alignContent?: string,
  alignSelf?: string,
  justifySelf?: string,
  outlineColor?: string,
  outlineWidth?: string,
  outlineStyle?: string,
  contentCentered?: bool,
  willChange?: string,
  transformOrigin?: string,
  backfaceVisibility?: string,
  transitionDuration?: string,
  transitionTimingFunction?: string,
  transitionDelay?: string,
  variant?: tagVariant,
}
