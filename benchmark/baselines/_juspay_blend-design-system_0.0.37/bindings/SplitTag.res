type props = {
  primaryTag: TagsTypes.tagsPrimaryTagConfig,
  secondaryTag?: TagsTypes.tagsPrimaryTagConfig,
  size?: TagsTypes.tagSize,
  shape?: TagsTypes.tagShape,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SplitTag"
