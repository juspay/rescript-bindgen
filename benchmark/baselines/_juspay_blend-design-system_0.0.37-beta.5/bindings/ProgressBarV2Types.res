type progressBarV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type progressBarV2Variant =
  | @as("linear") Linear
  | @as("circular") Circular
type progressBarV2Appearance =
  | @as("solid") Solid
  | @as("segmented") Segmented
type progressBarV2ProgressBarV2TokenTypeLinearHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig = {
  solid: string,
  segmented: string,
}
type progressBarV2ProgressBarV2TokenTypeLinearFillConfig = {
  backgroundColor: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  borderRadius: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
}
type progressBarV2ProgressBarV2TokenTypeLinearEmptyConfig = {
  backgroundColor: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  backgroundImage: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  backgroundSize: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
}
type progressBarV2ProgressBarV2TokenTypeLinearConfig = {
  height: progressBarV2ProgressBarV2TokenTypeLinearHeightConfig,
  fill: progressBarV2ProgressBarV2TokenTypeLinearFillConfig,
  empty: progressBarV2ProgressBarV2TokenTypeLinearEmptyConfig,
  borderRadius: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  gap: string,
}
type progressBarV2ProgressBarV2TokenTypeCircularStrokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type progressBarV2ProgressBarV2TokenTypeCircularConfig = {
  size: progressBarV2ProgressBarV2TokenTypeLinearHeightConfig,
  strokeWidth: progressBarV2ProgressBarV2TokenTypeCircularStrokeWidthConfig,
  stroke: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  background: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  dashArray: progressBarV2ProgressBarV2TokenTypeLinearFillBackgroundColorConfig,
  motion: string,
}
type progressBarV2ProgressBarV2TokenTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type progressBarV2TokenType = {
  linear: progressBarV2ProgressBarV2TokenTypeLinearConfig,
  circular: progressBarV2ProgressBarV2TokenTypeCircularConfig,
  label: progressBarV2ProgressBarV2TokenTypeLabelConfig,
  transition: string,
}
type responsiveProgressBarV2Tokens = {
  sm: progressBarV2TokenType,
  lg: progressBarV2TokenType,
}
type progressBarV2NormalizeRangeConfig = {
  min: float,
  max: float,
}
type progressBarV2GetProgressBarValueStateConfig = {
  rangeMin: float,
  rangeMax: float,
  clampedValue: float,
  percentage: float,
}
type progressBarV2ExtractProgressBarV2AriaPropsConfig = {
  @as("aria-label") ariaLabel?: string,
  @as("aria-labelledby") ariaLabelledby?: string,
  restProps: Dict.t<JSON.t>,
}
type progressBarV2GetCircularDimensionsConfig = {
  circularSize: string,
  sizeNum: float,
  strokeWidth: float,
  radius: float,
  circumference: float,
  center: float,
}
type progressBarV2CalculateCircularProgressStrokeConfig = {
  strokeDasharray: string,
  strokeDashoffset: float,
}
