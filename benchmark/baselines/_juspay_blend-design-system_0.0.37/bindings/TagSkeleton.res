type props = {
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  text?: string,
  size?: TagV2Types.tagV2Size,
  @as("type") type_?: TagV2Types.tagV2Type,
  subType?: TagV2Types.tagV2SubType,
  color?: TagV2Types.tagV2Color,
  leftSlot?: React.element,
  rightSlot?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TagSkeleton"
