type stableEnumNamesAvatarColor =
  | @as("primary") Primary
  | @as("secondary") Secondary
type stableEnumNamesTagColor =
  | @as("error") Error
  | @as("warning") Warning
  | @as("success") Success
type tagSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type stableEnumNamesBadgeColor =
  | @as("primary") Primary
  | @as("neutral") Neutral
  | @as("purple") Purple
  | @as("orange") Orange
type stableEnumNamesAvatarConfig = {
  color?: stableEnumNamesAvatarColor,
  label: string,
}
type stableEnumNamesTagConfig = {
  color?: stableEnumNamesTagColor,
  size?: tagSize,
}
type stableEnumNamesBadgeConfig = {
  color?: stableEnumNamesBadgeColor,
}
