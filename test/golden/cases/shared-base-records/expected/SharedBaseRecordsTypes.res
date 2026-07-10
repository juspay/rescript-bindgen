type sharedBaseRecordsSize =
  | @as("sm") Sm
  | @as("lg") Lg
type sharedBaseRecordsBaseSkeletonPropsVariant =
  | @as("pulse") Pulse
  | @as("wave") Wave
type baseSkeletonProps = {
  variant?: sharedBaseRecordsBaseSkeletonPropsVariant,
  loading?: bool,
}
type rec styledBlockProps = {
  _hover?: styledBlockProps,
  _focus?: styledBlockProps,
  color?: string,
  padding?: CommonTypes.stringOrNumber,
  margin?: CommonTypes.stringOrNumber,
  display?: string,
  gap?: CommonTypes.stringOrNumber,
}
