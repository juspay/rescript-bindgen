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
type components = {
  ...JsxDOM.domProps,
}
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
  allowDangerousHtml?: Nullable.t<bool>,
  clobberPrefix?: Nullable.t<string>,
  file?: Nullable.t<vFile>,
  footnoteBackContent?: string,
  footnoteBackLabel?: string,
  footnoteLabel?: Nullable.t<string>,
  footnoteLabelProperties?: Nullable.t<Dict.t<string>>,
  footnoteLabelTagName?: Nullable.t<string>,
  handlers?: string,
  passThrough?: Nullable.t<array<string>>,
  unknownHandler?: Nullable.t<(string, string, string) => string>,
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
type libMarkdownAsyncOptionsRemarkRehypeOptionsConfig = {
  allowDangerousHtml?: Nullable.t<bool>,
  clobberPrefix?: Nullable.t<string>,
  footnoteBackContent?: string,
  footnoteBackLabel?: Nullable.t<CommonTypes.footnoteBackLabel>,
  footnoteLabel?: Nullable.t<string>,
  footnoteLabelProperties?: Nullable.t<Dict.t<CommonTypes.boolOrStringOrNumberOrStringOrNumberArray>>,
  footnoteLabelTagName?: Nullable.t<string>,
  handlers?: string,
  passThrough?: Nullable.t<array<passThrough>>,
  unknownHandler?: Nullable.t<(state, string, string) => string>,
}
type libMarkdownAsyncOptionsConfig = {
  allowElement?: Nullable.t<(string, float, HastTypes.readonly) => bool>,
  allowedElements?: Nullable.t<array<string>>,
  children?: Nullable.t<string>,
  components?: Nullable.t<components>,
  disallowedElements?: Nullable.t<array<string>>,
  rehypePlugins?: Nullable.t<array<string>>,
  remarkPlugins?: Nullable.t<array<string>>,
  remarkRehypeOptions?: Nullable.t<libMarkdownAsyncOptionsRemarkRehypeOptionsConfig>,
  skipHtml?: Nullable.t<bool>,
  unwrapDisallowed?: Nullable.t<bool>,
  urlTransform?: Nullable.t<(string, string, string) => Nullable.t<string>>,
}
