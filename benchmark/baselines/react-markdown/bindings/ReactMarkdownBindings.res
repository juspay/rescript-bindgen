@module("react-markdown") external markdownAsync: (LibTypes.libMarkdownAsyncOptionsConfig) => promise<React.element> = "MarkdownAsync"
@module("react-markdown") external defaultUrlTransform: (string) => string = "defaultUrlTransform"
