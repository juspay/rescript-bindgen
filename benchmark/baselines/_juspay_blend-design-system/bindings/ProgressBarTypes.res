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
type heightConfig3 = {
  sm: string,
  md: string,
  lg: string,
}
type backgroundColorConfig10 = {
  solid: string,
  segmented: string,
}
type fillConfig2 = {
  backgroundColor: backgroundColorConfig10,
  borderRadius: backgroundColorConfig10,
}
type backgroundImageConfig = {
  segmented: string,
}
type emptyConfig = {
  backgroundColor: backgroundColorConfig10,
  backgroundImage: backgroundImageConfig,
  backgroundSize: backgroundImageConfig,
}
type linearConfig = {
  height: heightConfig3,
  fill: fillConfig2,
  empty: emptyConfig,
  borderRadius: backgroundColorConfig10,
}
type strokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type circularConfig = {
  size: heightConfig3,
  strokeWidth: strokeWidthConfig,
  stroke: backgroundColorConfig10,
  background: backgroundColorConfig10,
  dashArray: backgroundColorConfig10,
  dashOffset: backgroundColorConfig10,
}
type labelConfig6 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type progressBarTokenType = {
  linear: linearConfig,
  circular: circularConfig,
  label: labelConfig6,
  transition: string,
}
type responsiveProgressBarTokens = {
  sm: progressBarTokenType,
  lg: progressBarTokenType,
}
