@module("demo") @react.component
external make: (
  ~cells: Dict.t<string>,
  ~label: string=?,
) => React.element = "Grid"
