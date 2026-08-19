type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitClassNameColsDisabledIdOnBlurOnChangeOnFocusPlaceholderValue,
  disabled?: bool,
  value: string,
  onChange?: string => unit,
  topContent?: React.element,
  secondaryAction?: React.element,
  placeholder?: string,
  attachedFiles?: array<ContextSharedTypes.chatInputV2AttachedFile>,
  handleAttachClick?: unit => unit,
  onFileRemove?: string => unit,
  onFileClick?: ContextSharedTypes.chatInputV2AttachedFile => unit,
  onSecondaryActionClick?: unit => unit,
  id?: string,
  webTokens: ContextSharedTypes.chatInputV2TokensType,
  onEnter?: unit => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MobileChatInputV2"
