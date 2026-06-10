@unboxed type className = Str(string) | Fn(JSON.t => string)
@unboxed type formAction<'a> = Str(string) | Fn(WebTypes.formData => 'a)
@unboxed type weirdCb<'a> = Str(string) | Fn('a => string)
