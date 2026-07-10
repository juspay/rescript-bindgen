type codeBlockVariant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
  | @as("diff") Diff
type diffLineType =
  | @as("added") Added
  | @as("removed") Removed
  | @as("unchanged") Unchanged
type supportedLanguage =
  | @as("css") Css
  | @as("javascript") Javascript
  | @as("typescript") Typescript
  | @as("jsx") Jsx
  | @as("tsx") Tsx
  | @as("json") Json
  | @as("html") Html
  | @as("markdown") Markdown
  | @as("yaml") Yaml
  | @as("python") Python
  | @as("rust") Rust
  | @as("haskell") Haskell
type codeBlockCodeBlockTokenTypeHeaderPaddingConfig = {
  x: string,
  y: string,
}
type codeBlockCodeBlockTokenTypeHeaderIconConfig = {
  width: string,
}
type codeBlockCodeBlockTokenTypeHeaderTextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type codeBlockCodeBlockTokenTypeHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  padding: codeBlockCodeBlockTokenTypeHeaderPaddingConfig,
  gap: string,
  icon: codeBlockCodeBlockTokenTypeHeaderIconConfig,
  text: codeBlockCodeBlockTokenTypeHeaderTextConfig,
}
type codeBlockCodeBlockTokenTypeBodyGutterBackgroundColorConfig = {
  added: string,
  removed: string,
  unchanged: string,
}
type codeBlockCodeBlockTokenTypeBodyGutterConfig = {
  width: string,
  color: string,
  backgroundColor: codeBlockCodeBlockTokenTypeBodyGutterBackgroundColorConfig,
  borderLeft: codeBlockCodeBlockTokenTypeBodyGutterBackgroundColorConfig,
  borderColor: codeBlockCodeBlockTokenTypeBodyGutterBackgroundColorConfig,
}
type codeBlockCodeBlockTokenTypeBodyCodePaddingXConfig = {
  left: string,
  right: string,
}
type codeBlockCodeBlockTokenTypeBodyCodePaddingConfig = {
  x: codeBlockCodeBlockTokenTypeBodyCodePaddingXConfig,
  y: string,
}
type codeBlockCodeBlockTokenTypeBodyCodeConfig = {
  fontFamily: string,
  fontSize: string,
  lineHeight: string,
  padding: codeBlockCodeBlockTokenTypeBodyCodePaddingConfig,
}
type codeBlockCodeBlockTokenTypeBodyHighlightedLineConfig = {
  backgroundColor: codeBlockCodeBlockTokenTypeBodyGutterBackgroundColorConfig,
}
type codeBlockCodeBlockTokenTypeBodySyntaxConfig = {
  keyword: string,
  function: string,
  string: string,
  number: string,
  operator: string,
  variable: string,
  comment: string,
  text: string,
}
type codeBlockCodeBlockTokenTypeBodyExpandContextButtonConfig = {
  padding: string,
  dotsPadding: string,
  opacity: string,
  disabledOpacity: string,
  hoverBackgroundColor: string,
  borderRadius: string,
  iconSize: float,
}
type codeBlockCodeBlockTokenTypeBodyExpandContextConfig = {
  backgroundColor: string,
  borderTop: string,
  borderBottom: string,
  padding: string,
  color: string,
  fontSize: string,
  letterSpacing: string,
  button: codeBlockCodeBlockTokenTypeBodyExpandContextButtonConfig,
}
type codeBlockCodeBlockTokenTypeBodyConfig = {
  padding: codeBlockCodeBlockTokenTypeHeaderPaddingConfig,
  backgroundColor: string,
  gutter: codeBlockCodeBlockTokenTypeBodyGutterConfig,
  code: codeBlockCodeBlockTokenTypeBodyCodeConfig,
  highlightedLine: codeBlockCodeBlockTokenTypeBodyHighlightedLineConfig,
  syntax: codeBlockCodeBlockTokenTypeBodySyntaxConfig,
  expandContext: codeBlockCodeBlockTokenTypeBodyExpandContextConfig,
}
type codeBlockTokenType = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  header: codeBlockCodeBlockTokenTypeHeaderConfig,
  body: codeBlockCodeBlockTokenTypeBodyConfig,
}
type responsiveCodeBlockTokens = {
  sm: codeBlockTokenType,
  lg: codeBlockTokenType,
}
type diffLine = {
  content: string,
  @as("type") type_: diffLineType,
}
type codeBlockProps = {
  code: string,
  variant?: codeBlockVariant,
  showLineNumbers?: bool,
  showHeader?: bool,
  header?: string,
  headerLeftSlot?: React.element,
  headerRightSlot?: React.element,
  diffLines?: array<diffLine>,
  showCopyButton?: bool,
  autoFormat?: bool,
  language?: supportedLanguage,
  isDiffUnchangedCollapsed?: bool,
  diffContextLines?: float,
  diffExpandChunk?: float,
  maxHeight?: string,
}
