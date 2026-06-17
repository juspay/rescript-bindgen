@module("react-markdown") external markdownAsync: (LibTypes.libOptionsConfig) => promise<React.element> = "MarkdownAsync"
@module("react-markdown") external defaultUrlTransform: (string) => string = "defaultUrlTransform"
