@unboxed type classValue<'a> = Bool(bool) | Str(string) | Num(float) | Big(bigint) | Arr(array<JSON.t>) | Dict(Dict.t<'a>)
type boolOrStringOrNumberOrBigIntOrValueArrayOrValue<'a> = classValue<'a>
