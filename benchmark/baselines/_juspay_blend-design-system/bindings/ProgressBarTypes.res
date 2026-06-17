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
type progressBarHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type progressBarBackgroundColorConfig = {
  solid: string,
  segmented: string,
}
type progressBarFillConfig = {
  backgroundColor: progressBarBackgroundColorConfig,
  borderRadius: progressBarBackgroundColorConfig,
}
type progressBarBackgroundImageConfig = {
  segmented: string,
}
type progressBarEmptyConfig = {
  backgroundColor: progressBarBackgroundColorConfig,
  backgroundImage: progressBarBackgroundImageConfig,
  backgroundSize: progressBarBackgroundImageConfig,
}
type progressBarLinearConfig = {
  height: progressBarHeightConfig,
  fill: progressBarFillConfig,
  empty: progressBarEmptyConfig,
  borderRadius: progressBarBackgroundColorConfig,
}
type progressBarStrokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type progressBarCircularConfig = {
  size: progressBarHeightConfig,
  strokeWidth: progressBarStrokeWidthConfig,
  stroke: progressBarBackgroundColorConfig,
  background: progressBarBackgroundColorConfig,
  dashArray: progressBarBackgroundColorConfig,
  dashOffset: progressBarBackgroundColorConfig,
}
type progressBarLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type progressBarTokenType = {
  linear: progressBarLinearConfig,
  circular: progressBarCircularConfig,
  label: progressBarLabelConfig,
  transition: string,
}
type responsiveProgressBarTokens = {
  sm: progressBarTokenType,
  lg: progressBarTokenType,
}
