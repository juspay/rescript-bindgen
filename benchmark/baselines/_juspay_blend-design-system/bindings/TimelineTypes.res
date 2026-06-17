type timelineNodeStatus =
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("neutral") Neutral
type variant2 =
  | @as("pulse") Pulse
  | @as("wave") Wave
type timelineTrackConfig = {
  width?: string,
  backgroundColor?: string,
  left?: string,
}
type timelineIndicatorConfig = {
  left?: string,
  width?: string,
  height?: string,
}
type timelineStatusColors = {
  success: string,
  warning: string,
  error: string,
  neutral: string,
}
type timelineCircleConfig = {
  left?: string,
  width?: string,
  height?: string,
  backgroundColor?: string,
  border?: string,
}
type timelineMaskConfig = {
  backgroundColor?: string,
  height?: string,
}
type timelineTextConfig = {
  fontSize?: string,
  fontWeight?: string,
  color?: string,
}
type timelineLabelConfig = {
  paddingLeft?: string,
  marginBottom?: string,
  circle: timelineCircleConfig,
  mask: timelineMaskConfig,
  text: timelineTextConfig,
}
type timelineRowConfig = {
  paddingLeft?: string,
  marginBottom?: string,
  gap?: string,
}
type timelineSectionConfig = {
  marginBottom?: string,
}
type timelineTimestampConfig = {
  fontSize?: string,
  color?: string,
  gap?: string,
}
type timelineHeaderConfig = {
  row: timelineRowConfig,
  section: timelineSectionConfig,
  title: timelineTextConfig,
  timestamp: timelineTimestampConfig,
}
type timelineRootIndicatorConfig = {
  top?: string,
}
type timelineHeaderRowConfig = {
  gap?: string,
}
type timelineTitleConfig = {
  fontSize?: string,
  fontWeight?: string,
  color?: string,
  gap?: string,
}
type timelineDescriptionConfig = {
  fontSize?: string,
  color?: string,
  marginTop?: string,
  marginBottom?: string,
  lineHeight?: string,
}
type timelineConnectorConfig = {
  left?: string,
  width?: string,
  height?: string,
  color?: string,
}
type timelineAvatarConfig = {
  width?: string,
  height?: string,
  marginTop?: string,
}
type timelineUserConfig = {
  fontSize?: string,
  color?: string,
  marginLeft?: string,
}
type timelineTimeConfig = {
  fontSize?: string,
  color?: string,
}
type timelineSeparatorConfig = {
  width?: string,
  height?: string,
  color?: string,
  marginLeft?: string,
  marginRight?: string,
}
type timelineSubsectionConfig = {
  paddingLeft?: string,
  marginTop?: string,
  marginBottom?: string,
  marginLeft?: string,
  rootIndicator: timelineRootIndicatorConfig,
  headerRow: timelineHeaderRowConfig,
  titleRow: timelineHeaderRowConfig,
  datetimeGroup: timelineHeaderRowConfig,
  title: timelineTitleConfig,
  description: timelineDescriptionConfig,
  datetime: timelineTimestampConfig,
  connector: timelineConnectorConfig,
  avatar: timelineAvatarConfig,
  user: timelineUserConfig,
  time: timelineTimeConfig,
  separator: timelineSeparatorConfig,
}
type timelineShowMoreConfig = {
  paddingLeft?: string,
  marginTop?: string,
}
type timelineTokensType = {
  track: timelineTrackConfig,
  indicator: timelineIndicatorConfig,
  statusColors: timelineStatusColors,
  label: timelineLabelConfig,
  header: timelineHeaderConfig,
  subsection: timelineSubsectionConfig,
  showMore: timelineShowMoreConfig,
}
type responsiveTimelineTokens = {
  sm: timelineTokensType,
  lg: timelineTokensType,
}
type timelineUser = {
  name: string,
  avatar?: string,
  fallbackText?: string,
}
