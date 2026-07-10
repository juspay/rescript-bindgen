@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type stringOrNumberOrStringArray = Str(string) | Num(float) | StrArr(array<string>)
@unboxed type tabsFormAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
@unboxed type boolOrIndeterminate = Bool(bool) | @as("indeterminate") Indeterminate
@unboxed type preserveStartOrPreserveEndOrPreserveStartEndOrNumber = @as("preserveStart") PreserveStart | @as("preserveEnd") PreserveEnd | @as("preserveStartEnd") PreserveStartEnd | Num(float)
@unboxed type autoOrNumber = @as("auto") Auto | Num(float)
@unboxed type boolOrString = Bool(bool) | Str(string)
@unboxed type boolOrStringOrNumber = Bool(bool) | Str(string) | Num(float)
@unboxed type boolOrNumber = Bool(bool) | Num(float)
@unboxed type numberOrNumberArray = Num(float) | NumArr(array<float>)
@unboxed type boolOrAutoOrDefault = Bool(bool) | @as("auto") Auto | @as("default") Default
@unboxed type boolOrStringOrStringArray = Bool(bool) | Str(string) | StrArr(array<string>)
@unboxed type v0OrV100 = @as(0) N0 | @as(100) N100
@unboxed type dataTableRowActionConfigDisabled<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type dataTableRowActionConfigHidden<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type themeOrString = @as("light") Light | @as("dark") Dark | Custom(string)
@unboxed type stringOrNumberOrStringOrNumberArray = Str(string) | Num(float) | Arr(array<stringOrNumber>)
