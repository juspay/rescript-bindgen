type paddingConfig15 = {
  top: TagsTypes.paddingConfig4,
  bottom: TagsTypes.paddingConfig4,
  left: TagsTypes.paddingConfig4,
  right: TagsTypes.paddingConfig4,
}
type leftSlotConfig = {
  maxHeight: TagsTypes.paddingConfig4,
}
type textConfig23 = {
  color: TagsTypes.backgroundColorConfig3,
  fontSize: TagsTypes.paddingConfig4,
  fontWeight: TagsTypes.paddingConfig4,
  lineHeight: TagsTypes.paddingConfig4,
}
type smConfig17 = {
  border: TagsTypes.backgroundColorConfig3,
  borderRadius: TagsTypes.borderRadiusConfig3,
  backgroundColor: TagsTypes.backgroundColorConfig3,
  height: TagsTypes.paddingConfig4,
  padding: paddingConfig15,
  gap: string,
  leftSlot: leftSlotConfig,
  rightSlot: leftSlotConfig,
  text: textConfig23,
}
type responsiveTagV2Tokens = {
  sm: smConfig17,
  lg: smConfig17,
}
