type timelineNodeStatus =
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("neutral") Neutral
type variant2 =
  | @as("pulse") Pulse
  | @as("wave") Wave
type trackConfig = {
  width: string,
  backgroundColor: string,
  left: string,
}
type indicatorConfig4 = {
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
type circleConfig2 = {
  left: string,
  width: string,
  height: string,
  backgroundColor: string,
  border: string,
}
type maskConfig = {
  backgroundColor: string,
  height: string,
}
type labelConfig8 = {
  paddingLeft: string,
  marginBottom: string,
  circle: circleConfig2,
  mask: maskConfig,
  text: StatCardTypes.titleConfig3,
}
type rowConfig5 = {
  paddingLeft: string,
  marginBottom: string,
  gap: string,
}
type sectionConfig2 = {
  marginBottom: string,
}
type timestampConfig = {
  fontSize: string,
  color: string,
  gap: string,
}
type headerConfig15 = {
  row: rowConfig5,
  section: sectionConfig2,
  title: StatCardTypes.titleConfig3,
  timestamp: timestampConfig,
}
type rootIndicatorConfig = {
  top: string,
}
type descriptionConfig2 = {
  fontSize: string,
  color: string,
  marginTop: string,
  marginBottom: string,
  lineHeight: string,
}
type connectorConfig2 = {
  left: string,
  width: string,
  height: string,
  color: string,
}
type avatarConfig2 = {
  width: string,
  height: string,
  marginTop: string,
}
type userConfig = {
  fontSize: string,
  color: string,
  marginLeft: string,
}
type timeConfig = {
  fontSize: string,
  color: string,
}
type separatorConfig2 = {
  width: string,
  height: string,
  color: string,
  marginLeft: string,
  marginRight: string,
}
type subsectionConfig = {
  paddingLeft: string,
  marginTop: string,
  marginBottom: string,
  marginLeft: string,
  rootIndicator: rootIndicatorConfig,
  headerRow: ChartsTypes.slotsConfig,
  titleRow: ChartsTypes.slotsConfig,
  datetimeGroup: ChartsTypes.slotsConfig,
  title: CardTypes.titleConfig5,
  description: descriptionConfig2,
  datetime: timestampConfig,
  connector: connectorConfig2,
  avatar: avatarConfig2,
  user: userConfig,
  time: timeConfig,
  separator: separatorConfig2,
}
type showMoreConfig = {
  paddingLeft: string,
  marginTop: string,
}
type timelineTokensType = {
  track: trackConfig,
  indicator: indicatorConfig4,
  statusColors: timelineStatusColors,
  label: labelConfig8,
  header: headerConfig15,
  subsection: subsectionConfig,
  showMore: showMoreConfig,
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
