type skeletonVariant =
  | @as("pulse") Pulse
  | @as("wave") Wave
  | @as("shimmer") Shimmer
type skeletonShape =
  | @as("circle") Circle
  | @as("rectangle") Rectangle
  | @as("rounded") Rounded
type size2 =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("md") Md
type shape =
  | @as("circle") Circle
  | @as("square") Square
type valueConfig4 = {
  shouldShowSkeleton: bool,
  shouldShowContent: bool,
}
type animationConfig = {
  duration: string,
  timingFunction: string,
  iterationCount: string,
  direction: string,
}
type colorsConfig3 = {
  base: string,
  highlight: string,
  shimmer: string,
}
type borderRadiusConfig9 = {
  rectangle: string,
  rounded: string,
  circle: string,
}
type spacingConfig = {
  gap: string,
  margin: string,
}
type textConfig17 = {
  height: string,
  minWidth: string,
}
type avatarConfig2 = {
  sm: string,
  md: string,
  lg: string,
}
type buttonConfig2 = {
  sm: textConfig17,
  md: textConfig17,
  lg: textConfig17,
}
type sizesConfig = {
  text: textConfig17,
  avatar: avatarConfig2,
  button: buttonConfig2,
}
type skeletonTokensType = {
  animation: animationConfig,
  colors: colorsConfig3,
  borderRadius: borderRadiusConfig9,
  spacing: spacingConfig,
  sizes: sizesConfig,
}
type responsiveSkeletonTokens = {
  sm: skeletonTokensType,
  lg: skeletonTokensType,
}
