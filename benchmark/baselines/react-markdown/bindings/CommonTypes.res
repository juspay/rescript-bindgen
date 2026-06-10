@unboxed type footnoteBackContent = Str(string) | Fn((float, float) => string)
@unboxed type footnoteBackLabel = Str(string) | Fn((float, float) => string)
@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type boolOrStringOrNumberOrStringOrNumberArray = Bool(bool) | Str(string) | Num(float) | Arr(array<stringOrNumber>)
