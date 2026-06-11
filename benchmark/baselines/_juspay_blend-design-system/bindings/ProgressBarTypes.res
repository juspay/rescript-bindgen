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
type backgroundColorConfig9 = {
  solid: string,
  segmented: string,
}
type fillConfig2 = {
  backgroundColor: backgroundColorConfig9,
  borderRadius: backgroundColorConfig9,
}
type backgroundImageConfig = {
  segmented: string,
}
type emptyConfig = {
  backgroundColor: backgroundColorConfig9,
  backgroundImage: backgroundImageConfig,
  backgroundSize: backgroundImageConfig,
}
type linearConfig = {
  height: ButtonSharedTypes.slotMaxHeightConfig,
  fill: fillConfig2,
  empty: emptyConfig,
  borderRadius: backgroundColorConfig9,
}
type strokeWidthConfig = {
  sm: float,
  md: float,
  lg: float,
}
type circularConfig = {
  size: ButtonSharedTypes.slotMaxHeightConfig,
  strokeWidth: strokeWidthConfig,
  stroke: backgroundColorConfig9,
  background: backgroundColorConfig9,
  dashArray: backgroundColorConfig9,
  dashOffset: backgroundColorConfig9,
}
type progressBarTokenType = {
  linear: linearConfig,
  circular: circularConfig,
  label: StatCardTypes.titleConfig3,
  transition: string,
}
type responsiveProgressBarTokens = {
  sm: progressBarTokenType,
  lg: progressBarTokenType,
}
