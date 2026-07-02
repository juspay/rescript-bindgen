@unboxed type emptyStateAndSalvageClassName = Str(string) | Fn(JSON.t => string)
@unboxed type emptyStateAndSalvageFormAction<'a> = Str(string) | Fn(WebTypes.formData => 'a)
@unboxed type emptyStateAndSalvageWeirdCb<'a> = Str(string) | Fn('a => string)
