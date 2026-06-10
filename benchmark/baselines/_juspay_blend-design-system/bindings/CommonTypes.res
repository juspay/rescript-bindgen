@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type stringOrNumberOrStringArray = Str(string) | Num(float) | StrArr(array<string>)
@unboxed type formAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
@unboxed type boolOrIndeterminate = Bool(bool) | @as("indeterminate") Indeterminate
@unboxed type preserveStartOrPreserveEndOrPreserveStartEndOrNumber = @as("preserveStart") PreserveStart | @as("preserveEnd") PreserveEnd | @as("preserveStartEnd") PreserveStartEnd | Num(float)
@unboxed type disabled<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type hidden<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type themeOrString = @as("light") Light | @as("dark") Dark | Custom(string)
@unboxed type v0OrV100 = @as(0) N0 | @as(100) N100
@unboxed type boolOrStringOrNumber = Bool(bool) | Str(string) | Num(float)
@unboxed type stringOrValueArray = Str(string) | Arr(array<string>)
