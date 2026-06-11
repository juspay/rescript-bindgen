@module("demo") @react.component
external make: (
  ~value: Nullable.t<float>=?,
  ~count: int=?,
  ~render: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
  ~inputRef: React.ref<Nullable.t<Dom.htmlInputElement>>=?,
  ~anyRef: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Widget"
