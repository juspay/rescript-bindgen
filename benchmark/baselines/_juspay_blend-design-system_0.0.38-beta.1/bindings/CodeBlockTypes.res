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
type codeBlockCodeBlockTokenTypeBodyGutterConfig = {
  width: string,
  color: string,
  backgroundColor: string,  // ⚪ loose — was `{ added: BackgroundColor; removed: BackgroundColor; unchanged: BackgroundColor; }`
  borderLeft: string,  // ⚪ loose — was `{ added: BorderLeft<number | (string & {})>; removed: BorderLeft<number | (string & {})>; unchanged: BorderLef`
  borderColor: string,  // ⚪ loose — was `{ added: Color; removed: Color; unchanged: Color; }`
}
type codeBlockCodeBlockTokenTypeBodyCodeConfig = {
  fontFamily: string,
  fontSize: string,
  lineHeight: string,
  padding: string,  // ⚪ loose — was `{ x: { left: PaddingLeft<number | (string & {})>; right: PaddingRight<number | (string & {})>; }; y: Padding<n`
}
type codeBlockCodeBlockTokenTypeBodyHighlightedLineConfig = {
  backgroundColor: string,  // ⚪ loose — was `{ added: BackgroundColor; removed: BackgroundColor; unchanged: BackgroundColor; }`
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
type codeBlockCodeBlockTokenTypeBodyExpandContextConfig = {
  backgroundColor: string,
  borderTop: string,
  borderBottom: string,
  padding: string,
  color: string,
  fontSize: string,
  letterSpacing: string,
  button: string,  // ⚪ loose — was `{ padding: Padding<number | (string & {})>; dotsPadding: Padding<number | (string & {})>; opacity: Opacity; di`
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
