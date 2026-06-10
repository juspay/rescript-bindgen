@module("react-markdown") external markdownAsync: (LibTypes.optionsConfig) => promise<React.element> = "MarkdownAsync"
@module("react-markdown") external defaultUrlTransform: (string) => string = "defaultUrlTransform"
