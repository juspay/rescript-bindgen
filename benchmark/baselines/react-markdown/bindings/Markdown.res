// ⚠️ `Markdown` is a DEFAULT export — bound as `= "default"`. If the package does `module.exports = Markdown` (CJS), this may need a hand-adjustment; verify the import at runtime.
@module("react-markdown") @react.component
external make: (
  ~allowElement: string=?,  // ⚪ loose — was `AllowElement`
  ~allowedElements: array<string>=?,
  ~children: string=?,
  ~components: LibTypes.components=?,
  ~disallowedElements: array<string>=?,
  // ⚠️ REVIEW: `rehypePlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~rehypePlugins: string=?,
  // ⚠️ REVIEW: `remarkPlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~remarkPlugins: string=?,
  ~remarkRehypeOptions: LibTypes.remarkRehypeOptionsConfig=?,
  ~skipHtml: bool=?,
  ~unwrapDisallowed: bool=?,
  ~urlTransform: string=?,  // ⚪ loose — was `UrlTransform`
) => React.element = "default"
