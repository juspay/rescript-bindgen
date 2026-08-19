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
type tagsResponsiveTagTokensSmTextColorConfig = {
  noFill: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
  attentive: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
  subtle: tagsResponsiveTagTokensSmBackgroundColorNoFillConfig,
}
type tagsResponsiveTagTokensSmTextConfig = {
  color: tagsResponsiveTagTokensSmTextColorConfig,
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
  right?: string,
  bottom?: string,
  left?: string,
  outlineOffset?: string,
  marginLeft?: CommonTypes.stringOrNumber,
  paddingTop?: CommonTypes.stringOrNumber,
  paddingRight?: CommonTypes.stringOrNumber,
  paddingBottom?: CommonTypes.stringOrNumber,
  paddingLeft?: CommonTypes.stringOrNumber,
  maxHeight?: string,
  borderTop?: string,
  position?: string,
  marginTop?: CommonTypes.stringOrNumber,
  marginRight?: CommonTypes.stringOrNumber,
  marginBottom?: CommonTypes.stringOrNumber,
  leftSlot?: React.element,
  paddingX?: CommonTypes.stringOrNumber,
  flexDirection?: string,
  justifyContent?: string,
  alignItems?: string,
  overflowX?: string,
  overflowY?: string,
  flexShrink?: string,
  alignContent?: string,
  alignSelf?: string,
  backfaceVisibility?: string,
  backgroundImage?: string,
  backgroundSize?: string,
  borderBottomLeftRadius?: string,
  borderBottomRightRadius?: string,
  borderTopLeftRadius?: string,
  borderTopRightRadius?: string,
  columnGap?: string,
  cursor?: string,
  flexBasis?: string,
  flexGrow?: string,
  flexWrap?: string,
  justifySelf?: string,
  minHeight?: string,
  outlineColor?: string,
  outlineStyle?: string,
  outlineWidth?: string,
  pointerEvents?: string,
  rowGap?: string,
  textAlign?: string,
  textOverflow?: string,
  textTransform?: string,
  transform?: string,
  transformOrigin?: string,
  transitionDelay?: string,
  transitionDuration?: string,
  transitionTimingFunction?: string,
  userSelect?: string,
  whiteSpace?: string,
  willChange?: string,
  borderLeft?: string,
  borderRight?: string,
  overflow?: string,
  paddingY?: CommonTypes.stringOrNumber,
  rightSlot?: React.element,
  @as("as") as_?: SkeletonTypes.skeletonAs,
  _hover?: PrimitivesTypes.styledBlockProps,
  _focus?: PrimitivesTypes.styledBlockProps,
  _active?: PrimitivesTypes.styledBlockProps,
  _disabled?: PrimitivesTypes.styledBlockProps,
  _visited?: PrimitivesTypes.styledBlockProps,
  _focusVisible?: PrimitivesTypes.styledBlockProps,
  marginX?: CommonTypes.stringOrNumber,
  marginY?: CommonTypes.stringOrNumber,
  contentCentered?: bool,
  variant?: tagVariant,
}
