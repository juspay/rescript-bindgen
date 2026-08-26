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
type progressBarProgressBarTokenTypeLinearBorderRadiusConfig = {
  solid: string,
  segmented: string,
}
type progressBarProgressBarTokenTypeLinearFillConfig = {
  backgroundColor: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
  borderRadius: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
}
type __typeV1syf9 = {
  segmented: string,
}
type progressBarProgressBarTokenTypeLinearEmptyConfig = {
  backgroundColor: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
  backgroundImage: __typeV1syf9,
  backgroundSize: __typeV1syf9,
}
type progressBarProgressBarTokenTypeLinearConfig = {
  height: progressBarProgressBarTokenTypeLinearHeightConfig,
  fill: progressBarProgressBarTokenTypeLinearFillConfig,
  empty: progressBarProgressBarTokenTypeLinearEmptyConfig,
  borderRadius: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
}
type progressBarProgressBarTokenTypeCircularStrokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type progressBarProgressBarTokenTypeCircularConfig = {
  size: progressBarProgressBarTokenTypeLinearHeightConfig,
  strokeWidth: progressBarProgressBarTokenTypeCircularStrokeWidthConfig,
  stroke: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
  background: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
  dashArray: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
  dashOffset: progressBarProgressBarTokenTypeLinearBorderRadiusConfig,
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
