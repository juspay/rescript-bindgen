type statCardV2Variant =
  | @as("chart") Chart
  | @as("progress") Progress
  | @as("number") Number
type statCardV2ChangeType =
  | @as("increase") Increase
  | @as("decrease") Decrease
type statCardV2ArrowDirection =
  | @as("up") Up
  | @as("down") Down
type __typeV1h18p = {
  fontSize: string,
  fontWeight: string,
  color: string,
  lineHeight: string,
}
type __typeV1bifo = {
  default: string,
  hover: string,
}
type __typeV136nr = {
  width: string,
  height: string,
  color: __typeV1bifo,
}
type __typeV1ge6o = {
  gap: string,
  title: __typeV1h18p,
  helpIcon: __typeV136nr,
}
type statCardV2UseThemeStatsContainerValueConfig = {
  chart: __typeV1h18p,
  progress: __typeV1h18p,
  number: __typeV1h18p,
}
type statCardV2UseThemeStatsContainerChangeContainerChangeColorConfig = {
  increase: string,
  decrease: string,
}
type statCardV2UseThemeStatsContainerChangeContainerChangeConfig = {
  fontSize: string,
  fontWeight: string,
  color: statCardV2UseThemeStatsContainerChangeContainerChangeColorConfig,
  lineHeight: string,
}
type statCardV2UseThemeStatsContainerChangeContainerArrowConfig = {
  width: string,
  height: string,
  color: statCardV2UseThemeStatsContainerChangeContainerChangeColorConfig,
}
type statCardV2UseThemeStatsContainerChangeContainerConfig = {
  gap: string,
  change: statCardV2UseThemeStatsContainerChangeContainerChangeConfig,
  arrow: statCardV2UseThemeStatsContainerChangeContainerArrowConfig,
}
type statCardV2UseThemeStatsContainerConfig = {
  gap: string,
  value: statCardV2UseThemeStatsContainerValueConfig,
  changeContainer: statCardV2UseThemeStatsContainerChangeContainerConfig,
}
type statCardV2StatCardV2TokensTypeTopContainerDataContainerConfig = {
  gap: string,
  titleContainer: __typeV1ge6o,
  statsContainer: statCardV2UseThemeStatsContainerConfig,
  subtitle: __typeV1h18p,
}
type statCardV2StatCardV2TokensTypeTopContainerConfig = {
  gap: string,
  dataContainer: statCardV2StatCardV2TokensTypeTopContainerDataContainerConfig,
}
type statCardV2TokensType = {
  height: string,
  width: string,
  maxWidth: string,
  minWidth: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  border: string,
  borderRadius: string,
  backgroundColor: string,
  boxShadow: string,
  topContainer: statCardV2StatCardV2TokensTypeTopContainerConfig,
}
type responsiveStatCardV2Tokens = {
  sm: statCardV2TokensType,
  lg: statCardV2TokensType,
}
type statCardV2Change = {
  value: string,
  changeType: statCardV2ChangeType,
  leftSymbol?: string,
  rightSymbol?: string,
  arrowDirection?: statCardV2ArrowDirection,
  tooltip?: React.element,
}
type statCardV2SkeletonProps = {
  variant: SkeletonTypes.skeletonVariant,
  show: bool,
  height?: string,
  maxWidth?: string,
  minWidth?: string,
}
type statCardV2Dimensions = {
  width?: string,
  maxWidth?: string,
  minWidth?: string,
  height?: string,
}
type statCardV2BuildStatCardV2AriaLabelParamsConfig = {
  title?: string,
  value?: string,
  subtitle?: string,
  change?: statCardV2Change,
}
