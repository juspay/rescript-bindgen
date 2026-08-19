type props = {
  ...HtmlAttrs.htmlAttributesOmitAutoFocusChildrenClassNameOnBlurOnChangeOnFocusStyle,
  ...ContextSharedTypes.codeEditorV2Dimensions,
  value: string,
  onChange?: string => unit,
  variant?: ContextSharedTypes.codeEditorV2Variant,
  showLineNumbers?: bool,
  header?: ContextSharedTypes.codeEditorV2HeaderConfig,
  language?: ContextSharedTypes.codeEditorV2Language,
  placeholder?: string,
  readOnly?: bool,
  disabled?: bool,
  onBlur?: unit => unit,
  onFocus?: unit => unit,
  autoFocus?: bool,
  diff?: bool,
  originalValue?: string,
  renderSideBySide?: bool,
  isDiffUnchangedCollapsed?: bool,
  diffContextLines?: float,
  diffExpandChunk?: float,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CodeEditorV2"
