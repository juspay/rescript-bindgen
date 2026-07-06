type tagV2Size =
  | @as("xs") Xs
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type tagV2Type =
  | @as("noFill") NoFill
  | @as("attentive") Attentive
  | @as("subtle") Subtle
type tagV2SubType =
  | @as("rounded") Rounded
  | @as("squarical") Squarical
type tagV2Color =
  | @as("neutral") Neutral
  | @as("primary") Primary
  | @as("success") Success
  | @as("error") Error
  | @as("warning") Warning
  | @as("purple") Purple
type tagV2Color2 =
  | @as("neutral") Neutral
  | @as("primary") Primary
  | @as("success") Success
  | @as("error") Error
  | @as("warning") Warning
  | @as("purple") Purple
type tagV2ResponsiveTagV2TokensSmBorderNoFillConfig = {
  neutral: string,
  primary: string,
  success: string,
  error: string,
  warning: string,
  purple: string,
}
type tagV2ResponsiveTagV2TokensSmBorderConfig = {
  noFill: tagV2ResponsiveTagV2TokensSmBorderNoFillConfig,
  attentive: tagV2ResponsiveTagV2TokensSmBorderNoFillConfig,
  subtle: tagV2ResponsiveTagV2TokensSmBorderNoFillConfig,
}
type tagV2ResponsiveTagV2TokensSmBorderRadiusXsConfig = {
  rounded: string,
  squarical: string,
}
type tagV2ResponsiveTagV2TokensSmBorderRadiusConfig = {
  xs: tagV2ResponsiveTagV2TokensSmBorderRadiusXsConfig,
  sm: tagV2ResponsiveTagV2TokensSmBorderRadiusXsConfig,
  md: tagV2ResponsiveTagV2TokensSmBorderRadiusXsConfig,
  lg: tagV2ResponsiveTagV2TokensSmBorderRadiusXsConfig,
}
type tagV2ResponsiveTagV2TokensSmHeightConfig = {
  xs: string,
  sm: string,
  md: string,
  lg: string,
}
type tagV2ResponsiveTagV2TokensSmPaddingConfig = {
  top: tagV2ResponsiveTagV2TokensSmHeightConfig,
  bottom: tagV2ResponsiveTagV2TokensSmHeightConfig,
  left: tagV2ResponsiveTagV2TokensSmHeightConfig,
  right: tagV2ResponsiveTagV2TokensSmHeightConfig,
}
type tagV2ResponsiveTagV2TokensSmLeftSlotConfig = {
  maxHeight: tagV2ResponsiveTagV2TokensSmHeightConfig,
}
type tagV2ResponsiveTagV2TokensSmTextConfig = {
  color: tagV2ResponsiveTagV2TokensSmBorderConfig,
  fontSize: tagV2ResponsiveTagV2TokensSmHeightConfig,
  fontWeight: tagV2ResponsiveTagV2TokensSmHeightConfig,
  lineHeight: tagV2ResponsiveTagV2TokensSmHeightConfig,
}
type tagV2ResponsiveTagV2TokensSmConfig = {
  border: tagV2ResponsiveTagV2TokensSmBorderConfig,
  borderRadius: tagV2ResponsiveTagV2TokensSmBorderRadiusConfig,
  backgroundColor: tagV2ResponsiveTagV2TokensSmBorderConfig,
  height: tagV2ResponsiveTagV2TokensSmHeightConfig,
  padding: tagV2ResponsiveTagV2TokensSmPaddingConfig,
  gap: string,
  leftSlot: tagV2ResponsiveTagV2TokensSmLeftSlotConfig,
  rightSlot: tagV2ResponsiveTagV2TokensSmLeftSlotConfig,
  text: tagV2ResponsiveTagV2TokensSmTextConfig,
}
type responsiveTagV2Tokens = {
  sm: tagV2ResponsiveTagV2TokensSmConfig,
  lg: tagV2ResponsiveTagV2TokensSmConfig,
}
type tagV2LeftSlotConfig = {
  slot: React.element,
  maxHeight?: string,
}
type tagV2SkeletonConfig = {
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
}
