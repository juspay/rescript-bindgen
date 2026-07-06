type timelineNodeStatus =
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("neutral") Neutral
type timelineTimelineTokensTypeTrackConfig = {
  width: string,
  backgroundColor: string,
  left: string,
}
type timelineTimelineTokensTypeIndicatorConfig = {
  left: string,
  width: string,
  height: string,
}
type timelineStatusColors = {
  success: string,
  warning: string,
  error: string,
  neutral: string,
}
type timelineTimelineTokensTypeLabelCircleConfig = {
  left: string,
  width: string,
  height: string,
  backgroundColor: string,
  border: string,
}
type timelineTimelineTokensTypeLabelMaskConfig = {
  backgroundColor: string,
  height: string,
}
type timelineTimelineTokensTypeLabelTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type timelineTimelineTokensTypeLabelConfig = {
  paddingLeft: string,
  marginBottom: string,
  circle: timelineTimelineTokensTypeLabelCircleConfig,
  mask: timelineTimelineTokensTypeLabelMaskConfig,
  text: timelineTimelineTokensTypeLabelTextConfig,
}
type timelineTimelineTokensTypeHeaderRowConfig = {
  paddingLeft: string,
  marginBottom: string,
  gap: string,
}
type timelineTimelineTokensTypeHeaderSectionConfig = {
  marginBottom: string,
}
type timelineTimelineTokensTypeHeaderTimestampConfig = {
  fontSize: string,
  color: string,
  gap: string,
}
type timelineTimelineTokensTypeHeaderConfig = {
  row: timelineTimelineTokensTypeHeaderRowConfig,
  section: timelineTimelineTokensTypeHeaderSectionConfig,
  title: timelineTimelineTokensTypeLabelTextConfig,
  timestamp: timelineTimelineTokensTypeHeaderTimestampConfig,
}
type timelineTimelineTokensTypeSubsectionRootIndicatorConfig = {
  top: string,
}
type timelineTimelineTokensTypeSubsectionHeaderRowConfig = {
  gap: string,
}
type timelineTimelineTokensTypeSubsectionTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  gap: string,
}
type timelineTimelineTokensTypeSubsectionDescriptionConfig = {
  fontSize: string,
  color: string,
  marginTop: string,
  marginBottom: string,
  lineHeight: string,
}
type timelineTimelineTokensTypeSubsectionConnectorConfig = {
  left: string,
  width: string,
  height: string,
  color: string,
}
type timelineTimelineTokensTypeSubsectionAvatarConfig = {
  width: string,
  height: string,
  marginTop: string,
}
type timelineTimelineTokensTypeSubsectionUserConfig = {
  fontSize: string,
  color: string,
  marginLeft: string,
}
type timelineTimelineTokensTypeSubsectionTimeConfig = {
  fontSize: string,
  color: string,
}
type timelineTimelineTokensTypeSubsectionSeparatorConfig = {
  width: string,
  height: string,
  color: string,
  marginLeft: string,
  marginRight: string,
}
type timelineTimelineTokensTypeSubsectionConfig = {
  paddingLeft: string,
  marginTop: string,
  marginBottom: string,
  marginLeft: string,
  rootIndicator: timelineTimelineTokensTypeSubsectionRootIndicatorConfig,
  headerRow: timelineTimelineTokensTypeSubsectionHeaderRowConfig,
  titleRow: timelineTimelineTokensTypeSubsectionHeaderRowConfig,
  datetimeGroup: timelineTimelineTokensTypeSubsectionHeaderRowConfig,
  title: timelineTimelineTokensTypeSubsectionTitleConfig,
  description: timelineTimelineTokensTypeSubsectionDescriptionConfig,
  datetime: timelineTimelineTokensTypeHeaderTimestampConfig,
  connector: timelineTimelineTokensTypeSubsectionConnectorConfig,
  avatar: timelineTimelineTokensTypeSubsectionAvatarConfig,
  user: timelineTimelineTokensTypeSubsectionUserConfig,
  time: timelineTimelineTokensTypeSubsectionTimeConfig,
  separator: timelineTimelineTokensTypeSubsectionSeparatorConfig,
}
type timelineTimelineTokensTypeShowMoreConfig = {
  paddingLeft: string,
  marginTop: string,
}
type timelineTokensType = {
  track: timelineTimelineTokensTypeTrackConfig,
  indicator: timelineTimelineTokensTypeIndicatorConfig,
  statusColors: timelineStatusColors,
  label: timelineTimelineTokensTypeLabelConfig,
  header: timelineTimelineTokensTypeHeaderConfig,
  subsection: timelineTimelineTokensTypeSubsectionConfig,
  showMore: timelineTimelineTokensTypeShowMoreConfig,
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
