type codeBlockVariant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
  | @as("diff") Diff
type diffLineType =
  | @as("added") Added
  | @as("removed") Removed
  | @as("unchanged") Unchanged
type supportedLanguage =
  | @as("html") Html
  | @as("javascript") Javascript
  | @as("typescript") Typescript
  | @as("jsx") Jsx
  | @as("tsx") Tsx
  | @as("json") Json
  | @as("css") Css
  | @as("markdown") Markdown
  | @as("yaml") Yaml
  | @as("python") Python
  | @as("rust") Rust
  | @as("haskell") Haskell
type diffLine = {
  content: string,
  @as("type") type_: diffLineType,
}
type codeBlockPaddingConfig = {
  x?: string,
  y?: string,
}
type codeBlockIconConfig = {
  width?: string,
}
type codeBlockTextConfig = {
  fontSize?: string,
  fontWeight?: string,
  lineHeight?: string,
  color?: string,
}
type codeBlockHeaderConfig = {
  backgroundColor?: string,
  borderBottom?: string,
  padding: codeBlockPaddingConfig,
  gap?: string,
  icon: codeBlockIconConfig,
  text: codeBlockTextConfig,
}
type codeBlockBackgroundColorConfig = {
  added: string,
  removed: string,
  unchanged: string,
}
type codeBlockGutterConfig = {
  width?: string,
  color?: string,
  backgroundColor: codeBlockBackgroundColorConfig,
  borderLeft: codeBlockBackgroundColorConfig,
  borderColor: codeBlockBackgroundColorConfig,
}
type codeBlockXConfig = {
  left?: string,
  right?: string,
}
type codeBlockPaddingConfig2 = {
  x: codeBlockXConfig,
  y?: string,
}
type codeBlockCodeConfig = {
  fontFamily?: string,
  fontSize?: string,
  lineHeight?: string,
  padding: codeBlockPaddingConfig2,
}
type codeBlockHighlightedLineConfig = {
  backgroundColor: codeBlockBackgroundColorConfig,
}
type codeBlockSyntaxConfig = {
  keyword?: string,
  function?: string,
  string?: string,
  number?: string,
  operator?: string,
  variable?: string,
  comment?: string,
  text?: string,
}
type codeBlockBodyConfig = {
  padding: codeBlockPaddingConfig,
  backgroundColor?: string,
  gutter: codeBlockGutterConfig,
  code: codeBlockCodeConfig,
  highlightedLine: codeBlockHighlightedLineConfig,
  syntax: codeBlockSyntaxConfig,
}
type codeBlockTokenType = {
  backgroundColor?: string,
  border?: string,
  borderRadius?: string,
  boxShadow?: string,
  header: codeBlockHeaderConfig,
  body: codeBlockBodyConfig,
}
type responsiveCodeBlockTokens = {
  sm: codeBlockTokenType,
  lg: codeBlockTokenType,
}
