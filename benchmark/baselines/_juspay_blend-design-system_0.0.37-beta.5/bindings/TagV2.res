type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameColorStyle,
  text: string,
  size?: TagV2Types.tagV2Size,
  @as("type") type_?: TagV2Types.tagV2Type,
  subType?: TagV2Types.tagV2SubType,
  color?: TagV2Types.tagV2Color,
  leftSlot?: TagV2Types.tagV2LeftSlotConfig,
  rightSlot?: TagV2Types.tagV2LeftSlotConfig,
  skeleton?: TagV2Types.tagV2SkeletonConfig,
  tagGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TagV2"
