@module("@juspay/blend-design-system") @react.component
external make: (
  ~title: string=?,
  ~leftSlot: React.element=?,
  ~rightSlot: React.element=?,
  ~showCopyButton: bool,
  ~isCopied: bool,
  ~onCopy: unit => unit,
  ~tokens: EditorSharedTypes.codeEditorV2Tokens,
) => React.element = "CodeEditorV2Header"
