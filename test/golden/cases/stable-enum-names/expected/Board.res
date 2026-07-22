type props = {
  avatar?: StableEnumNamesTypes.stableEnumNamesAvatarConfig,
  tag?: StableEnumNamesTypes.stableEnumNamesTagConfig,
  badge?: StableEnumNamesTypes.stableEnumNamesBadgeConfig,
}

@module("demo")
external make: React.component<props> = "Board"
