@module("demo") @react.component
external make: (
  ~toString: unit => string=?,
  ~hasOwnProperty: bool=?,
  ~onPick: string=?,  // ⚪ loose — was `(arg: valueOf) => void`
) => React.element = "Proto"
