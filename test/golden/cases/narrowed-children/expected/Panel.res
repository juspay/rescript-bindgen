@module("demo") @react.component
external make: (
  ~children: React.element=?,
  ~title: string=?,
) => React.element = "Panel"
