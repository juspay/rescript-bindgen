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
type paddingConfig23 = {
  x: string,
  y: string,
}
type iconConfig9 = {
  width: string,
}
type textConfig24 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type headerConfig15 = {
  backgroundColor: string,
  borderBottom: string,
  padding: paddingConfig23,
  gap: string,
  icon: iconConfig9,
  text: textConfig24,
}
type backgroundColorConfig20 = {
  added: string,
  removed: string,
  unchanged: string,
}
type gutterConfig = {
  width: string,
  color: string,
  backgroundColor: backgroundColorConfig20,
  borderLeft: backgroundColorConfig20,
  borderColor: backgroundColorConfig20,
}
type xConfig = {
  left: string,
  right: string,
}
type paddingConfig24 = {
  x: xConfig,
  y: string,
}
type codeConfig2 = {
  fontFamily: string,
  fontSize: string,
  lineHeight: string,
  padding: paddingConfig24,
}
type highlightedLineConfig = {
  backgroundColor: backgroundColorConfig20,
}
type syntaxConfig = {
  keyword: string,
  function: string,
  string: string,
  number: string,
  operator: string,
  variable: string,
  comment: string,
  text: string,
}
type bodyConfig5 = {
  padding: paddingConfig23,
  backgroundColor: string,
  gutter: gutterConfig,
  code: codeConfig2,
  highlightedLine: highlightedLineConfig,
  syntax: syntaxConfig,
}
type codeBlockTokenType = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  header: headerConfig15,
  body: bodyConfig5,
}
type responsiveCodeBlockTokens = {
  sm: codeBlockTokenType,
  lg: codeBlockTokenType,
}
