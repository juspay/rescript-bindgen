type cardVariant =
  | @as("default") Default
  | @as("aligned") Aligned
  | @as("custom") Custom
type cardAlignment =
  | @as("vertical") Vertical
  | @as("horizontal") Horizontal
type cardCardTokenTypePaddingDefaultConfig = {
  x: string,
  y: string,
}
type cardCardTokenTypePaddingConfig = {
  default: cardCardTokenTypePaddingDefaultConfig,
  aligned: cardCardTokenTypePaddingDefaultConfig,
  custom: string,  // ⚪ loose — was `undefined`
}
type cardCardTokenTypeHeaderTextTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  gap: string,
}
type cardCardTokenTypeHeaderTextSubTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type cardCardTokenTypeHeaderTextConfig = {
  title: cardCardTokenTypeHeaderTextTitleConfig,
  subTitle: cardCardTokenTypeHeaderTextSubTitleConfig,
  gap: string,
}
type cardCardTokenTypeHeaderDefaultConfig = {
  backgroundColor: string,
  padding: cardCardTokenTypePaddingDefaultConfig,
  borderBottom: string,
}
type cardCardTokenTypeHeaderConfig = {
  text: cardCardTokenTypeHeaderTextConfig,
  default: cardCardTokenTypeHeaderDefaultConfig,
  aligned: string,  // ⚪ loose — was `undefined`
  custom: string,  // ⚪ loose — was `undefined`
}
type cardCardTokenTypeBodyPaddingConfig = {
  default: cardCardTokenTypePaddingDefaultConfig,
  aligned: string,  // ⚪ loose — was `undefined`
  custom: string,  // ⚪ loose — was `undefined`
}
type cardCardTokenTypeBodyGapConfig = {
  default: string,
  aligned: string,
  custom: string,
}
type cardCardTokenTypeBodyTextContentConfig = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type cardCardTokenTypeBodyTextConfig = {
  title: cardCardTokenTypeHeaderTextSubTitleConfig,
  content: cardCardTokenTypeBodyTextContentConfig,
  gap: string,
}
type cardCardTokenTypeBodyActionsConfig = {
  gap: string,
  centerAlignGap: string,
}
type cardCardTokenTypeBodyAlignmentAlignedCardSlotConfig = {
  vertical: string,  // ⚪ loose — was `{ marginBottom: MarginBottom<number | (string & {})>; minHeight: MinHeight<number | (string & {})>; }`
  horizontal: string,  // ⚪ loose — was `{ marginRight: MarginRight<number | (string & {})>; width: Width<number | (string & {})>; height: Height<numbe`
}
type cardCardTokenTypeBodyAlignmentAlignedConfig = {
  cardSlot: cardCardTokenTypeBodyAlignmentAlignedCardSlotConfig,
}
type cardCardTokenTypeBodyAlignmentConfig = {
  aligned: cardCardTokenTypeBodyAlignmentAlignedConfig,
  default: string,  // ⚪ loose — was `undefined`
  custom: string,  // ⚪ loose — was `undefined`
}
type cardCardTokenTypeBodyConfig = {
  padding: cardCardTokenTypeBodyPaddingConfig,
  gap: cardCardTokenTypeBodyGapConfig,
  text: cardCardTokenTypeBodyTextConfig,
  actions: cardCardTokenTypeBodyActionsConfig,
  alignment: cardCardTokenTypeBodyAlignmentConfig,
}
type cardTokenType = {
  maxWidth: string,
  borderRadius: string,
  border: string,
  boxShadow: string,
  backgroundColor: string,
  padding: cardCardTokenTypePaddingConfig,
  header: cardCardTokenTypeHeaderConfig,
  body: cardCardTokenTypeBodyConfig,
}
type responsiveCardTokens = {
  sm: cardTokenType,
  lg: cardTokenType,
}
type cardSkeletonProps = {
  variant: SkeletonTypes.skeletonVariant,
  show: bool,
  height?: string,
  width?: string,
}
