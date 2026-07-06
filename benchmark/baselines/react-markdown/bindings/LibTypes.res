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
type vFile = {
  cwd: string,
  data: string,  // ⚪ loose — was `Data`
  history: string,  // ⚪ loose — was `string[]`
  messages: string,  // ⚪ loose — was `VFileMessage[]`
  value: string,  // ⚪ loose — was `Value`
  map: string,  // ⚪ loose — was `Map`
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
type options = {
  allowDangerousHtml?: Nullable.t<bool>,
  clobberPrefix?: Nullable.t<string>,
  file?: Nullable.t<vFile>,
  footnoteBackContent?: string,  // ⚠️ REVIEW — was `string | FootnoteBackContentTemplate` — match the real type by hand
  footnoteBackLabel?: Nullable.t<CommonTypes.libOptionsFootnoteBackLabel>,
  footnoteLabel?: Nullable.t<string>,
  footnoteLabelProperties?: Nullable.t<Dict.t<string>>,  // ⚪ loose — was `string | number | boolean | (string | number)[]`
  footnoteLabelTagName?: Nullable.t<string>,
  handlers?: string,  // ⚪ loose — was `Partial<Record<"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "bre`
  passThrough?: Nullable.t<array<string>>,  // ⚪ loose — was `"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "break" | "definiti`
  unknownHandler?: Nullable.t<(string, string, string) => string>,  // ⚪ loose — was `ElementContent | ElementContent[]`
}
type state = {
  all: string => array<string>,  // ⚠️ REVIEW — was `ElementContent` — match the real type by hand
  applyData: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `Element | Type`
  definitionById: Map.t<string, string>,  // ⚪ loose — was `Definition`
  footnoteById: Map.t<string, string>,  // ⚪ loose — was `FootnoteDefinition`
  footnoteCounts: Map.t<string, float>,
  footnoteOrder: array<string>,
  handlers: string,  // ⚪ loose — was `Partial<Record<"text" | "root" | "blockquote" | "code" | "html" | "link" | "strong" | "table" | "image" | "bre`
  one: (string, string) => string,  // ⚠️ REVIEW — was `ElementContent | ElementContent[]` — match the real type by hand
  options: options,
  patch: (string, string) => unit,  // ⚠️ REVIEW — was `Nodes` — match the real type by hand
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
  unknownHandler?: Nullable.t<(state, string, string) => string>,  // 🛑 BROKEN — contains `any` — was `ElementContent | ElementContent[]`
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
