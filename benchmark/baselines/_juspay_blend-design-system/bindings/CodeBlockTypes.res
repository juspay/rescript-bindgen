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
type textConfig21 = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type headerConfig14 = {
  backgroundColor: string,
  borderBottom: string,
  padding: ModalTypes.paddingConfig5,
  gap: string,
  icon: StatCardTypes.titleIconConfig,
  text: textConfig21,
}
type backgroundColorConfig16 = {
  added: string,
  removed: string,
  unchanged: string,
}
type gutterConfig = {
  width: string,
  color: string,
  backgroundColor: backgroundColorConfig16,
  borderLeft: backgroundColorConfig16,
  borderColor: backgroundColorConfig16,
}
type xConfig = {
  left: string,
  right: string,
}
type paddingConfig13 = {
  x: xConfig,
  y: string,
}
type codeConfig2 = {
  fontFamily: string,
  fontSize: string,
  lineHeight: string,
  padding: paddingConfig13,
}
type highlightedLineConfig = {
  backgroundColor: backgroundColorConfig16,
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
  padding: ModalTypes.paddingConfig5,
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
  header: headerConfig14,
  body: bodyConfig5,
}
type responsiveCodeBlockTokens = {
  sm: codeBlockTokenType,
  lg: codeBlockTokenType,
}
