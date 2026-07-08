@@warning("-30")

type libMarkdownAsyncOptionsRemarkRehypeOptionsPassThrough =
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
type vFileMessage = {
  ...JsxDOM.domProps,
  ancestors: array<JSON.t>,
  column: float,
  fatal: bool,
  file: string,
  line: float,
  place: UnistTypes.LibVFileMessagePlace.t,
  reason: string,
  ruleId: string,
  source: string,
  actual: string,
  expected: array<string>,
  note: string,
  url: string,
}
type vFile = {
  cwd: string,
  data: string,  // ⚪ loose — was `Data`
  history: array<string>,
  messages: array<vFileMessage>,
  value: string,  // ⚪ loose — was `Value`
  map: VfileTypes.map,
  result: JSON.t,
  stored: bool,
  basename: string,
  path: string,
  dirname: string,
  extname: string,
  stem: string,
  fail: string,  // ⚪ loose — was `{ (reason: string, options?: Options): never; (reason: string, parent: Node | NodeLike, origin?: string): neve`
  info: string,  // ⚪ loose — was `{ (reason: string, options?: Options): VFileMessage; (reason: string, parent: Node | NodeLike, origin?: string`
  message: string,  // ⚪ loose — was `{ (reason: string, options?: Options): VFileMessage; (reason: string, parent: Node | NodeLike, origin?: string`
  toString: option<string> => string,
}
type rec options = {
  allowDangerousHtml?: Nullable.t<bool>,
  clobberPrefix?: Nullable.t<string>,
  file?: Nullable.t<vFile>,
  footnoteBackContent?: string,  // ⚠️ REVIEW — was `string | FootnoteBackContentTemplate` — match the real type by hand
  footnoteBackLabel?: Nullable.t<CommonTypes.libOptionsFootnoteBackLabel>,
  footnoteLabel?: Nullable.t<string>,
  footnoteLabelProperties?: Nullable.t<Dict.t<CommonTypes.boolOrStringOrNumberOrStringOrNumberArray>>,
  footnoteLabelTagName?: Nullable.t<string>,
  handlers?: string,  // ⚪ loose — was `Partial<Record<"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "bre`
  passThrough?: Nullable.t<array<libMarkdownAsyncOptionsRemarkRehypeOptionsPassThrough>>,
  unknownHandler?: Nullable.t<(state, string, MdastTypes.Parents.t) => string>,  // ⚪ loose — was `ElementContent | ElementContent[]`
}
and state = {
  all: MdastTypes.Nodes.t => array<string>,  // ⚪ loose — was `ElementContent`
  applyData: (MdastTypes.Nodes.t, string) => string,  // 🛑 BROKEN — contains `unknown` — was `Element | Type`
  definitionById: Map.t<string, string>,  // ⚪ loose — was `Definition`
  footnoteById: Map.t<string, string>,  // ⚪ loose — was `FootnoteDefinition`
  footnoteCounts: Map.t<string, float>,
  footnoteOrder: array<string>,
  handlers: string,  // ⚪ loose — was `Partial<Record<"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "bre`
  one: (MdastTypes.Nodes.t, MdastTypes.Parents.t) => string,  // ⚠️ REVIEW — was `ElementContent | ElementContent[]` — match the real type by hand
  options: options,
  patch: (MdastTypes.Nodes.t, string) => unit,  // ⚠️ REVIEW — was `Nodes` — match the real type by hand
  wrap: (array<string>, option<bool>) => array<string>,  // ⚪ loose — was `Text | Type`
}
type libMarkdownAsyncOptionsRemarkRehypeOptionsConfig = {
  allowDangerousHtml?: Nullable.t<bool>,
  clobberPrefix?: Nullable.t<string>,
  footnoteBackContent?: string,  // ⚠️ REVIEW — was `string | FootnoteBackContentTemplate` — match the real type by hand
  footnoteBackLabel?: Nullable.t<CommonTypes.libMarkdownAsyncOptionsRemarkRehypeOptionsFootnoteBackLabel>,
  footnoteLabel?: Nullable.t<string>,
  footnoteLabelProperties?: Nullable.t<Dict.t<CommonTypes.boolOrStringOrNumberOrStringOrNumberArray>>,
  footnoteLabelTagName?: Nullable.t<string>,
  handlers?: string,  // ⚪ loose — was `Partial<Record<"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "bre`
  passThrough?: Nullable.t<array<libMarkdownAsyncOptionsRemarkRehypeOptionsPassThrough>>,
  unknownHandler?: Nullable.t<(state, string, MdastTypes.Parents.t) => string>,  // 🛑 BROKEN — contains `any` — was `ElementContent | ElementContent[]`
}
type libMarkdownAsyncOptionsConfig = {
  allowElement?: Nullable.t<(string, float, HastTypes.readonly) => bool>,  // ⚪ loose — was `Readonly<Element>`
  allowedElements?: Nullable.t<array<string>>,
  children?: Nullable.t<string>,
  components?: Nullable.t<components>,
  disallowedElements?: Nullable.t<array<string>>,
  rehypePlugins?: Nullable.t<array<string>>,  // ⚠️ REVIEW — was `Pluggable` — match the real type by hand
  remarkPlugins?: Nullable.t<array<string>>,  // ⚠️ REVIEW — was `Pluggable` — match the real type by hand
  remarkRehypeOptions?: Nullable.t<libMarkdownAsyncOptionsRemarkRehypeOptionsConfig>,
  skipHtml?: Nullable.t<bool>,
  unwrapDisallowed?: Nullable.t<bool>,
  urlTransform?: Nullable.t<(string, string, string) => Nullable.t<string>>,  // ⚪ loose — was `Readonly<Element>`
}
