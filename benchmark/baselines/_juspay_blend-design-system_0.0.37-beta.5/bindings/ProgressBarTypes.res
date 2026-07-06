type progressBarSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type progressBarVariant =
  | @as("solid") Solid
  | @as("segmented") Segmented
  | @as("circular") Circular
type progressBarType =
  | @as("solid") Solid
  | @as("segmented") Segmented
type progressBarProgressBarTokenTypeLinearHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig = {
  solid: string,
  segmented: string,
}
type progressBarProgressBarTokenTypeLinearFillConfig = {
  backgroundColor: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
  borderRadius: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
}
type progressBarProgressBarTokenTypeLinearEmptyBackgroundImageConfig = {
  segmented: string,
}
type progressBarProgressBarTokenTypeLinearEmptyConfig = {
  backgroundColor: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
  backgroundImage: progressBarProgressBarTokenTypeLinearEmptyBackgroundImageConfig,
  backgroundSize: progressBarProgressBarTokenTypeLinearEmptyBackgroundImageConfig,
}
type progressBarProgressBarTokenTypeLinearConfig = {
  height: progressBarProgressBarTokenTypeLinearHeightConfig,
  fill: progressBarProgressBarTokenTypeLinearFillConfig,
  empty: progressBarProgressBarTokenTypeLinearEmptyConfig,
  borderRadius: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
}
type progressBarProgressBarTokenTypeCircularStrokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type progressBarProgressBarTokenTypeCircularConfig = {
  size: progressBarProgressBarTokenTypeLinearHeightConfig,
  strokeWidth: progressBarProgressBarTokenTypeCircularStrokeWidthConfig,
  stroke: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
  background: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
  dashArray: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
  dashOffset: progressBarProgressBarTokenTypeLinearFillBackgroundColorConfig,
}
type progressBarProgressBarTokenTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type progressBarTokenType = {
  linear: progressBarProgressBarTokenTypeLinearConfig,
  circular: progressBarProgressBarTokenTypeCircularConfig,
  label: progressBarProgressBarTokenTypeLabelConfig,
  transition: string,
}
type responsiveProgressBarTokens = {
  sm: progressBarTokenType,
  lg: progressBarTokenType,
}
