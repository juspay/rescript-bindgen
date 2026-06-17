type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitDisabledMaxLengthOnChangePlaceholderValue,
  disabled?: bool,
  maxLength?: int,
  placeholder?: string,
  value?: string,
  slot1?: React.element,
  slot2?: React.element,
  onChange?: string => unit,
  onSend?: (string, array<ChatInputTypes.attachedFile>) => unit,
  onAttachFiles?: array<Webapi.File.t> => unit,
  onVoiceRecord?: unit => unit,
  onFileRemove?: string => unit,
  onFileClick?: ChatInputTypes.attachedFile => unit,
  autoResize?: bool,
  attachedFiles?: array<ChatInputTypes.attachedFile>,
  topQueries?: array<ChatInputTypes.topQuery>,
  onTopQuerySelect?: ChatInputTypes.topQuery => unit,
  topQueriesMaxHeight?: float,
  attachButtonIcon?: React.element,
  voiceButtonIcon?: React.element,
  sendButtonIcon?: React.element,
  overflowMenuProps?: MenuTypes.menuOverflowMenuPropsConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChatInput"
