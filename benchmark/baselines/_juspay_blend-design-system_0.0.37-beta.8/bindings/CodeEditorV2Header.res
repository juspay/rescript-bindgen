type props = {
  title?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  showCopyButton: bool,
  isCopied: bool,
  onCopy: unit => unit,
  tokens: EditorSharedTypes.codeEditorV2Tokens,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CodeEditorV2Header"
