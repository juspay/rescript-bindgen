@module("demo") @react.component
external make: (
  ~title: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DomBox"
