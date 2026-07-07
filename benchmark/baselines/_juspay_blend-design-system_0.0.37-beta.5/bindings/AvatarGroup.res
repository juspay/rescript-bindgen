type props = {
  ...HtmlAttrs.htmlAttributesOmitChildren,
  avatars: array<AvatarGroupTypes.avatarData>,
  maxCount?: float,
  size?: AvatarTypes.avatarSize,
  shape?: AvatarTypes.avatarShape,
  selectedAvatarIds?: array<CommonTypes.stringOrNumber>,
  onSelectionChange?: array<CommonTypes.stringOrNumber> => unit,
  skeleton?: AvatarGroupTypes.avatarGroupSkeletonConfig,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "AvatarGroup"
