type skeletonVariant =
  | @as("pulse") Pulse
  | @as("wave") Wave
  | @as("shimmer") Shimmer
type skeletonShapeV61p6w =
  | @as("circle") Circle
  | @as("rectangle") Rectangle
  | @as("rounded") Rounded
type skeletonShapeV126nt =
  | @as("circle") Circle
  | @as("square") Square
type baseSkeletonProps = {
  variant?: skeletonVariant,
  loading?: bool,
  @as("data-testid") dataTestid?: string,
}
type skeletonSkeletonTokensTypeAnimationConfig = {
  duration: string,
  timingFunction: string,
  iterationCount: string,
  direction: string,
}
type skeletonSkeletonTokensTypeColorsConfig = {
  base: string,
  highlight: string,
  shimmer: string,
}
type skeletonSkeletonTokensTypeBorderRadiusConfig = {
  rectangle: string,
  rounded: string,
  circle: string,
}
type skeletonSkeletonTokensTypeSpacingConfig = {
  gap: string,
  margin: string,
}
type skeletonSkeletonTokensTypeSizesTextConfig = {
  height: string,
  minWidth: string,
}
type skeletonSkeletonTokensTypeSizesAvatarConfig = {
  sm: string,
  md: string,
  lg: string,
}
type skeletonSkeletonTokensTypeSizesButtonConfig = {
  sm: skeletonSkeletonTokensTypeSizesTextConfig,
  md: skeletonSkeletonTokensTypeSizesTextConfig,
  lg: skeletonSkeletonTokensTypeSizesTextConfig,
}
type skeletonSkeletonTokensTypeSizesConfig = {
  text: skeletonSkeletonTokensTypeSizesTextConfig,
  avatar: skeletonSkeletonTokensTypeSizesAvatarConfig,
  button: skeletonSkeletonTokensTypeSizesButtonConfig,
}
type skeletonTokensType = {
  animation: skeletonSkeletonTokensTypeAnimationConfig,
  colors: skeletonSkeletonTokensTypeColorsConfig,
  borderRadius: skeletonSkeletonTokensTypeBorderRadiusConfig,
  spacing: skeletonSkeletonTokensTypeSpacingConfig,
  sizes: skeletonSkeletonTokensTypeSizesConfig,
}
type skeletonUseSkeletonBaseConfig = {
  shouldRender: bool,
  fallback: React.element,
  tokens: skeletonTokensType,
  prefersReducedMotion: bool,
}
type skeletonGetSkeletonStateConfig = {
  shouldShowSkeleton: bool,
  shouldShowContent: bool,
}
type responsiveSkeletonTokens = {
  sm: skeletonTokensType,
  lg: skeletonTokensType,
}
