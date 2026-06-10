// ⚪ loose: `MarkdownAsync` has a param/return widened to `string`.
@module("react-markdown") external markdownAsync: (LibTypes.optionsConfig) => string = "MarkdownAsync"
@module("react-markdown") external defaultUrlTransform: (string) => string = "defaultUrlTransform"
