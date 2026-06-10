type variant =
  | @as("default") Default
  | @as("aligned") Aligned
  | @as("custom") Custom
type cardSkeletonProps = {
  variant: ButtonSkeletonTypes.skeletonVariant,
  show: bool,
  height?: string,
  width?: string,
}
type paddingConfig8 = {
  default: ModalTypes.paddingConfig5,
  aligned: ModalTypes.paddingConfig5,
  custom: string,
}
type titleConfig5 = {
  fontSize: string,
  fontWeight: string,
  color: string,
  gap: string,
}
type textConfig14 = {
  title: titleConfig5,
  subTitle: StatCardTypes.titleConfig3,
  gap: string,
}
type defaultConfig5 = {
  backgroundColor: string,
  padding: ModalTypes.paddingConfig5,
  borderBottom: string,
}
type headerConfig7 = {
  text: textConfig14,
  default: defaultConfig5,
  aligned: string,
  custom: string,
}
type paddingConfig9 = {
  default: ModalTypes.paddingConfig5,
  aligned: string,
  custom: string,
}
type gapConfig3 = {
  default: string,
  aligned: string,
  custom: string,
}
type contentConfig3 = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type textConfig15 = {
  title: StatCardTypes.titleConfig3,
  content: contentConfig3,
  gap: string,
}
type actionsConfig2 = {
  gap: string,
  centerAlignGap: string,
}
type cardSlotConfig = {
  vertical: string,
  horizontal: string,
}
type alignedConfig = {
  cardSlot: cardSlotConfig,
}
type alignmentConfig = {
  aligned: alignedConfig,
  default: string,
  custom: string,
}
type bodyConfig3 = {
  padding: paddingConfig9,
  gap: gapConfig3,
  text: textConfig15,
  actions: actionsConfig2,
  alignment: alignmentConfig,
}
type cardTokenType = {
  maxWidth: string,
  borderRadius: string,
  border: string,
  boxShadow: string,
  backgroundColor: string,
  padding: paddingConfig8,
  header: headerConfig7,
  body: bodyConfig3,
}
type responsiveCardTokens = {
  sm: cardTokenType,
  lg: cardTokenType,
}
