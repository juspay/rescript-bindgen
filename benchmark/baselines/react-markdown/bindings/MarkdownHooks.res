type props<'a, 'f> = {
  allowElement?: Nullable.t<('a, float, HastTypes.readonly) => bool>,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  allowedElements?: Nullable.t<array<string>>,
  children?: Nullable.t<string>,
  components?: Nullable.t<LibTypes.components>,
  disallowedElements?: Nullable.t<array<string>>,
  // ⚠️ REVIEW: `rehypePlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  rehypePlugins?: string,
  // ⚠️ REVIEW: `remarkPlugins` is `PluggableList` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  remarkPlugins?: string,
  remarkRehypeOptions?: Nullable.t<LibTypes.libMarkdownAsyncOptionsRemarkRehypeOptionsConfig>,
  skipHtml?: Nullable.t<bool>,
  unwrapDisallowed?: Nullable.t<bool>,
  urlTransform?: Nullable.t<(string, string, 'f) => Nullable.t<string>>,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  fallback?: React.element,
}

@module("react-markdown")
external make: React.component<props<'a, 'f>> = "MarkdownHooks"
