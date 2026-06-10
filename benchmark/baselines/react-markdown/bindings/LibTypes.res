type passThrough =
  | @as("text") Text
  | @as("root") Root
  | @as("blockquote") Blockquote
  | @as("code") Code
  | @as("html") Html
  | @as("link") Link
  | @as("strong") Strong
  | @as("table") Table
  | @as("image") Image
  | @as("break") Break
  | @as("definition") Definition
  | @as("delete") Delete
  | @as("emphasis") Emphasis
  | @as("footnoteDefinition") FootnoteDefinition
  | @as("footnoteReference") FootnoteReference
  | @as("heading") Heading
  | @as("imageReference") ImageReference
  | @as("inlineCode") InlineCode
  | @as("linkReference") LinkReference
  | @as("list") List
  | @as("listItem") ListItem
  | @as("paragraph") Paragraph
  | @as("tableCell") TableCell
  | @as("tableRow") TableRow
  | @as("thematicBreak") ThematicBreak
  | @as("yaml") Yaml
type vFile = {
  cwd: string,
  data: string,
  history: string,
  messages: string,
  value: string,
  map: string,
  result: string,
  stored: string,
  basename: string,
  path: string,
  dirname: string,
  extname: string,
  stem: string,
  fail: string,
  info: string,
  message: string,
  toString: string,
}
type options = {
  allowDangerousHtml?: bool,
  clobberPrefix?: string,
  file?: vFile,
  footnoteBackContent?: CommonTypes.footnoteBackContent2,
  footnoteBackLabel?: CommonTypes.footnoteBackLabel2,
  footnoteLabel?: string,
  footnoteLabelProperties?: Dict.t<string>,
  footnoteLabelTagName?: string,
  handlers?: string,
  passThrough?: array<string>,
  unknownHandler?: (string, string, string) => string,
}
type state = {
  all: string => array<string>,
  applyData: (string, string) => string,
  definitionById: Map.t<string, string>,
  footnoteById: Map.t<string, string>,
  footnoteCounts: Map.t<string, float>,
  footnoteOrder: array<string>,
  handlers: string,
  one: (string, string) => string,
  options: options,
  patch: (string, string) => unit,
  wrap: (array<string>, option<bool>) => array<string>,
}
type remarkRehypeOptionsConfig = {
  allowDangerousHtml?: bool,
  clobberPrefix?: string,
  footnoteBackContent?: CommonTypes.footnoteBackContent,
  footnoteBackLabel?: CommonTypes.footnoteBackLabel,
  footnoteLabel?: string,
  footnoteLabelProperties?: Dict.t<CommonTypes.boolOrStringOrNumberOrStringOrNumberArray>,
  footnoteLabelTagName?: string,
  handlers?: string,
  passThrough?: array<passThrough>,
  unknownHandler?: (state, string, string) => string,
}
type optionsConfig = {
  allowElement?: (string, float, HastTypes.readonly) => bool,
  allowedElements?: array<string>,
  children?: string,
  components?: HastTypes.readonly,
  disallowedElements?: array<string>,
  rehypePlugins?: array<string>,
  remarkPlugins?: array<string>,
  remarkRehypeOptions?: remarkRehypeOptionsConfig,
  skipHtml?: bool,
  unwrapDisallowed?: bool,
  urlTransform?: (string, string, string) => string,
}
