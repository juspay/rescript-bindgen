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
type statCardV2StatCardV2TokensTypeTopContainerDataContainerConfig = {
  gap: string,
  titleContainer: __typeV1ge6o,
  statsContainer: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; value: { chart: { fontSize: FontSize<number | (string & {})>; fontWeight: `
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
