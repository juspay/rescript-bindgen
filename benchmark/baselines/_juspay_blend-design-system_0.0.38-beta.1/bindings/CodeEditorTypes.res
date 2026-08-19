type codeEditorVariant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
type codeEditorLanguage =
  | @as("ruby") Ruby
  | @as("plaintext") Plaintext
  | @as("c") C
  | @as("css") Css
  | @as("javascript") Javascript
  | @as("typescript") Typescript
  | @as("json") Json
  | @as("html") Html
  | @as("markdown") Markdown
  | @as("yaml") Yaml
  | @as("python") Python
  | @as("rust") Rust
  | @as("scss") Scss
  | @as("less") Less
  | @as("xml") Xml
  | @as("ini") Ini
  | @as("graphql") Graphql
  | @as("sql") Sql
  | @as("go") Go
  | @as("java") Java
  | @as("kotlin") Kotlin
  | @as("swift") Swift
  | @as("cpp") Cpp
  | @as("csharp") Csharp
  | @as("php") Php
  | @as("shell") Shell
  | @as("powershell") Powershell
  | @as("dockerfile") Dockerfile
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
  language?: codeEditorLanguage,
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
