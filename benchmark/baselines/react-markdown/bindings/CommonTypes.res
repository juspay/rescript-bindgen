@unboxed type libMarkdownAsyncOptionsRemarkRehypeOptionsFootnoteBackLabel = Str(string) | Fn((float, float) => string)
@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type libOptionsFootnoteBackLabel = Str(string) | Fn((float, float) => string)
@unboxed type boolOrStringOrNumberOrStringOrNumberArray = Bool(bool) | Str(string) | Num(float) | Arr(array<stringOrNumber>)
