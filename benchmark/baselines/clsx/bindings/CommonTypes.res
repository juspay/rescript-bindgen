@unboxed type boolOrStringOrNumberOrBigIntOrValueArrayOrValue<'a> = Bool(bool) | Str(string) | Num(float) | Big(bigint) | Arr(array<JSON.t>) | Dict(Dict.t<'a>)
