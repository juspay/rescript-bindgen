type props = {
  ...CodeBlockTypes.codeBlockProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CodeBlock"
