@module("demo") @react.component
external make: (
  ~avatar: StableEnumNamesTypes.stableEnumNamesAvatarConfig=?,
  ~tag: StableEnumNamesTypes.stableEnumNamesTagConfig=?,
  ~badge: StableEnumNamesTypes.stableEnumNamesBadgeConfig=?,
) => React.element = "Board"
