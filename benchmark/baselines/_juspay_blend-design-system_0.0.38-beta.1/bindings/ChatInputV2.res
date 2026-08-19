type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitClassNameColsDisabledOnBlurOnChangeOnFocusPlaceholderStyleValue,
  value?: string,
  topQueries?: array<ContextSharedTypes.chatInputV2TopQuery>,
  onTopQuerySelect?: ContextSharedTypes.chatInputV2TopQuery => unit,
  placeholder?: string,
  onChange: string => unit,
  topContent?: React.element,
  secondaryAction?: React.element,
  onSecondaryActionClick?: unit => unit,
  topQueriesMaxHeight?: float,
  textareaMaxHeight?: float,
  disabled?: bool,
  attachedFiles?: array<ContextSharedTypes.chatInputV2AttachedFile>,
  onAttachFiles?: array<Webapi.File.t> => unit,
  onFileRemove?: string => unit,
  onFileClick?: ContextSharedTypes.chatInputV2AttachedFile => unit,
  onEnter?: unit => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChatInputV2"
