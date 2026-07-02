@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
@unboxed type boolOrIndeterminate = Bool(bool) | @as("indeterminate") Indeterminate
@unboxed type unboxedUnionsItemHeight = Num(float) | Fn(float => float)
