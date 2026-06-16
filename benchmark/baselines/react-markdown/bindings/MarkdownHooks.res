@module("react-markdown") @react.component
external make: (
  ~allowElement: ('a, float, HastTypes.readonly) => bool=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~allowedElements: array<string>=?,
  ~children: Nullable.t<string>=?,
  ~components: LibTypes.components=?,
  ~disallowedElements: array<string>=?,
  // ⚠️ REVIEW: `rehypePlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~rehypePlugins: string=?,
  // ⚠️ REVIEW: `remarkPlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~remarkPlugins: string=?,
  ~remarkRehypeOptions: LibTypes.remarkRehypeOptionsConfig=?,
  ~skipHtml: Nullable.t<bool>=?,
  ~unwrapDisallowed: Nullable.t<bool>=?,
  ~urlTransform: (string, string, 'e) => string=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~fallback: React.element=?,
) => React.element = "MarkdownHooks"
