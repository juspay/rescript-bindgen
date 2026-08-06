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
  color?: SplitTagTypes.splitTagPrimaryTagColor,
  zIndex?: string,
  minWidth?: string,
  maxWidth?: string,
  backgroundColor?: string,
  border?: string,
  text: string,
  inset?: string,
  borderBottom?: string,
  outline?: string,
  transition?: string,
  top?: string,
  left?: string,
  outlineOffset?: string,
  marginLeft?: CommonTypes.stringOrNumber,
  paddingTop?: CommonTypes.stringOrNumber,
  paddingRight?: CommonTypes.stringOrNumber,
  paddingBottom?: CommonTypes.stringOrNumber,
  paddingLeft?: CommonTypes.stringOrNumber,
  maxHeight?: string,
  bottom?: string,
  right?: string,
  marginTop?: CommonTypes.stringOrNumber,
  marginRight?: CommonTypes.stringOrNumber,
  marginBottom?: CommonTypes.stringOrNumber,
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
  paddingX?: CommonTypes.stringOrNumber,
  paddingY?: CommonTypes.stringOrNumber,
  marginX?: CommonTypes.stringOrNumber,
  marginY?: CommonTypes.stringOrNumber,
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
