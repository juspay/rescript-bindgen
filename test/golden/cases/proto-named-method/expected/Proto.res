@module("demo") @react.component
external make: (
  ~toString: unit => string=?,
  ~hasOwnProperty: bool=?,
  ~onPick: 'a => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
) => React.element = "Proto"
