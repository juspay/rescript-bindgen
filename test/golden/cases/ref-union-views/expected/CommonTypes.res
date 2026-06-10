@unboxed type toggleFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(bool => bool)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
