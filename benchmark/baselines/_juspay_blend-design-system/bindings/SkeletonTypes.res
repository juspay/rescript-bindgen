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
type skeletonValueConfig = {
  shouldRender: bool,
  fallback: React.element,
  tokens: string,
  prefersReducedMotion: bool,
}
type skeletonAnimationConfig = {
  duration?: string,
  timingFunction?: string,
  iterationCount?: string,
  direction?: string,
}
type skeletonColorsConfig = {
  base?: string,
  highlight?: string,
  shimmer?: string,
}
type skeletonBorderRadiusConfig = {
  rectangle?: string,
  rounded?: string,
  circle?: string,
}
type skeletonSpacingConfig = {
  gap?: string,
  margin?: string,
}
type skeletonTextConfig = {
  height?: string,
  minWidth?: string,
}
type skeletonAvatarConfig = {
  sm?: string,
  md?: string,
  lg?: string,
}
type skeletonSmConfig = {
  height?: string,
  minWidth?: string,
}
type skeletonButtonConfig = {
  sm: skeletonSmConfig,
  md: skeletonSmConfig,
  lg: skeletonSmConfig,
}
type skeletonSizesConfig = {
  text: skeletonTextConfig,
  avatar: skeletonAvatarConfig,
  button: skeletonButtonConfig,
}
type skeletonTokensType = {
  animation: skeletonAnimationConfig,
  colors: skeletonColorsConfig,
  borderRadius: skeletonBorderRadiusConfig,
  spacing: skeletonSpacingConfig,
  sizes: skeletonSizesConfig,
}
type skeletonValueConfig2 = {
  shouldRender: bool,
  fallback: string,
  tokens: skeletonTokensType,
  prefersReducedMotion: bool,
}
type skeletonValueConfig3 = {
  shouldShowSkeleton: bool,
  shouldShowContent: bool,
}
type responsiveSkeletonTokens = {
  sm: skeletonTokensType,
  lg: skeletonTokensType,
}
