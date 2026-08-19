type animationTiming =
  | @as("ease") Ease
  | @as("ease-in") EaseIn
  | @as("ease-in-out") EaseInOut
  | @as("ease-out") EaseOut
  | @as("linear") Linear
type allowInDimension = {
  x?: bool,
  y?: bool,
}
type utilTooltipPropsCoordinateConfig = {
  x?: float,
  y?: float,
}
type cartesianViewBox = {
  x?: float,
  y?: float,
  width?: float,
  height?: float,
}
