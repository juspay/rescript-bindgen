type variant =
  | @as("default") Default
  | @as("aligned") Aligned
  | @as("custom") Custom
type cardAlignment =
  | @as("vertical") Vertical
  | @as("horizontal") Horizontal
type cardSkeletonProps = {
  variant: SkeletonTypes.skeletonVariant,
  show: bool,
  height?: string,
  width?: string,
}
type cardDefaultConfig = {
  x: string,
  y: string,
}
type cardPaddingConfig = {
  default: cardDefaultConfig,
  aligned: cardDefaultConfig,
  custom: string,
}
type cardTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  gap: string,
}
type cardSubTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type cardTextConfig = {
  title: cardTitleConfig,
  subTitle: cardSubTitleConfig,
  gap: string,
}
type cardDefaultConfig2 = {
  backgroundColor: string,
  padding: cardDefaultConfig,
  borderBottom: string,
}
type cardHeaderConfig = {
  text: cardTextConfig,
  default: cardDefaultConfig2,
  aligned: string,
  custom: string,
}
type cardPaddingConfig2 = {
  default: cardDefaultConfig,
  aligned: string,
  custom: string,
}
type cardGapConfig = {
  default: string,
  aligned: string,
  custom: string,
}
type cardContentConfig = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type cardTextConfig2 = {
  title: cardSubTitleConfig,
  content: cardContentConfig,
  gap: string,
}
type cardActionsConfig = {
  gap: string,
  centerAlignGap: string,
}
type cardCardSlotConfig = {
  vertical: string,
  horizontal: string,
}
type cardAlignedConfig = {
  cardSlot: cardCardSlotConfig,
}
type cardAlignmentConfig = {
  aligned: cardAlignedConfig,
  default: string,
  custom: string,
}
type cardBodyConfig = {
  padding: cardPaddingConfig2,
  gap: cardGapConfig,
  text: cardTextConfig2,
  actions: cardActionsConfig,
  alignment: cardAlignmentConfig,
}
type cardTokenType = {
  maxWidth: string,
  borderRadius: string,
  border: string,
  boxShadow: string,
  backgroundColor: string,
  padding: cardPaddingConfig,
  header: cardHeaderConfig,
  body: cardBodyConfig,
}
type responsiveCardTokens = {
  sm: cardTokenType,
  lg: cardTokenType,
}
