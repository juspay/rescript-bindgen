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
  custom: unit,
}
type cardCardTokenTypeHeaderTextConfig = {
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; gap: Gap<number | (string `
  subTitle: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  gap: string,
}
type cardCardTokenTypeHeaderDefaultConfig = {
  backgroundColor: string,
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  borderBottom: string,
}
type cardCardTokenTypeHeaderConfig = {
  text: cardCardTokenTypeHeaderTextConfig,
  default: cardCardTokenTypeHeaderDefaultConfig,
  aligned: unit,
  custom: unit,
}
type cardCardTokenTypeBodyPaddingConfig = {
  default: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  aligned: unit,
  custom: unit,
}
type cardCardTokenTypeBodyGapConfig = {
  default: string,
  aligned: string,
  custom: string,
}
type cardCardTokenTypeBodyTextConfig = {
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  content: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; color: Color; fontWeight: FontWeight; }`
  gap: string,
}
type cardCardTokenTypeBodyActionsConfig = {
  gap: string,
  centerAlignGap: string,
}
type cardCardTokenTypeBodyAlignmentConfig = {
  aligned: string,  // ⚪ loose — was `{ cardSlot: { vertical: { marginBottom: MarginBottom<number | (string & {})>; minHeight: MinHeight<number | (s`
  default: unit,
  custom: unit,
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
