@module("@juspay/blend-design-system") @react.component
external make: (
  ~code: string,
  ~variant: CodeBlockTypes.codeBlockVariant=?,
  ~showLineNumbers: bool=?,
  ~showHeader: bool=?,
  ~header: string=?,
  ~headerLeftSlot: React.element=?,
  ~headerRightSlot: React.element=?,
  ~diffLines: array<CodeBlockTypes.diffLine>=?,
  ~showCopyButton: bool=?,
  ~autoFormat: bool=?,
  ~language: CodeBlockTypes.supportedLanguage=?,
  ~isDiffUnchangedCollapsed: bool=?,
  ~diffContextLines: float=?,
  ~diffExpandChunk: float=?,
  ~maxHeight: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "CodeBlock"
