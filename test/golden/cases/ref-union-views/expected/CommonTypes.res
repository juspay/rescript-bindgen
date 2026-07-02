@unboxed type refUnionViewsToggleFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(bool => bool)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
