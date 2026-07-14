@module("demo") external parse: (string) => float = "parse"
@module("demo") external parseWithRadix: (string, float) => float = "parse"
@module("demo") external wrap: (string) => string = "wrap"
@module("demo") external wrapForCount: (int) => string = "wrap"
