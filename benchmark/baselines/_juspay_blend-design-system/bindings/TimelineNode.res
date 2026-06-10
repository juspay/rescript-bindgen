type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenTitle,
  title?: string,
  children?: React.element,
  leftSlot?: React.element,
  headerRightSlot?: React.element,
  datetime?: string,
  datetimeLeftSlot?: React.element,
  datetimeRightSlot?: React.element,
  text?: string,
  maxLines?: float,
  user?: TimelineTypes.timelineUser,
  avatarProps?: AvatarV2Types.avatarPropsConfig,
  time?: string,
  status?: TimelineTypes.timelineNodeStatus,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TimelineNode"
