type codeEditorVariant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
type codeEditorProps = {
  value: string,
  onChange?: string => unit,
  variant?: codeEditorVariant,
  showLineNumbers?: bool,
  showHeader?: bool,
  header?: string,
  headerLeftSlot?: React.element,
  headerRightSlot?: React.element,
  showLeftIcon?: bool,
  showCopyButton?: bool,
  language?: CodeBlockTypes.supportedLanguage,
  placeholder?: string,
  readOnly?: bool,
  disabled?: bool,
  minHeight?: CommonTypes.stringOrNumber,
  maxHeight?: CommonTypes.stringOrNumber,
  height?: CommonTypes.stringOrNumber,
  className?: string,
  onBlur?: unit => unit,
  onFocus?: unit => unit,
  autoFocus?: bool,
}
