type props = {
  ...HtmlAttrs.htmlAttributesOmitChildren,
  src?: string,
  alt?: string,
  fallback?: React.element,
  size?: AvatarTypes.avatarSize,
  shape?: AvatarTypes.avatarShape,
  online?: bool,
  onlinePosition?: AvatarTypes.avatarOnlinePosition,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  skeleton?: AvatarTypes.avatarSkeletonConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Avatar"
