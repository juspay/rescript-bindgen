type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameSizeStyleValue,
  value: string,
  label?: string,
  subLabel?: string,
  size?: EditorSharedTypes.inputSizeV2,
  error?: EditorSharedTypes.inputsV2ErrorConfig,
  hintText?: string,
  helpIconText?: string,
  dropdown?: EditorSharedTypes.InputsV2Dropdown.t,  // ⓘ was `TextInputV2Dropdown | TextInputV2Dropdown[]` — opaque; build with InputsV2Dropdown.fromTextInputV2Dropdown / InputsV2Dropdown.fromTextInputV2Dropdowns
  leftSlot?: EditorSharedTypes.inputsV2LeftSlotConfig,
  rightSlot?: EditorSharedTypes.inputsV2LeftSlotConfig,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TextInputV2"
