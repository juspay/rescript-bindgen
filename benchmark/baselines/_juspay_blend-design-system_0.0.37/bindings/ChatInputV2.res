type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitClassNameColsDisabledOnBlurOnChangeOnFocusPlaceholderStyleValue,
  value?: string,
  topQueries?: array<EditorSharedTypes.chatInputV2TopQuery>,
  onTopQuerySelect?: EditorSharedTypes.chatInputV2TopQuery => unit,
  placeholder?: string,
  onChange: string => unit,
  topContent?: React.element,
  secondaryAction?: React.element,
  onSecondaryActionClick?: unit => unit,
  topQueriesMaxHeight?: float,
  textareaMaxHeight?: float,
  disabled?: bool,
  attachedFiles?: array<EditorSharedTypes.chatInputV2AttachedFile>,
  onAttachFiles?: array<Webapi.File.t> => unit,
  onFileRemove?: string => unit,
  onFileClick?: EditorSharedTypes.chatInputV2AttachedFile => unit,
  onEnter?: unit => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChatInputV2"
