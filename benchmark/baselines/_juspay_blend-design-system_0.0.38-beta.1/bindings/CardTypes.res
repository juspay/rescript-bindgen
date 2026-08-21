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
type __typeT1lr4 = {
  fontSize: string,
  fontWeight: string,
  color: string,
  gap: string,
}
type __typeUx2o02 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type cardCardTokenTypeHeaderTextConfig = {
  title: __typeT1lr4,
  subTitle: __typeUx2o02,
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
  aligned: unit,
  custom: unit,
}
type cardCardTokenTypeBodyPaddingConfig = {
  default: cardCardTokenTypePaddingDefaultConfig,
  aligned: unit,
  custom: unit,
}
type cardCardTokenTypeBodyGapConfig = {
  default: string,
  aligned: string,
  custom: string,
}
type __typeQb0or = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type cardCardTokenTypeBodyTextConfig = {
  title: __typeUx2o02,
  content: __typeQb0or,
  gap: string,
}
type cardCardTokenTypeBodyActionsConfig = {
  gap: string,
  centerAlignGap: string,
}
type __typeLzdw5 = {
  marginBottom: string,
  minHeight: string,
}
type __typeFzq0p = {
  marginRight: string,
  width: string,
  height: string,
}
type __typeV1dcia = {
  vertical: __typeLzdw5,
  horizontal: __typeFzq0p,
}
type __typeV1moml = {
  cardSlot: __typeV1dcia,
}
type cardCardTokenTypeBodyAlignmentConfig = {
  aligned: __typeV1moml,
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
