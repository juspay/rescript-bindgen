@module("demo") @react.component
external make: (
  ~multi: bool=?,
) => React.element = "Select"

// Compound statics — zero-cost aliases; use <Select.Option />
module Option = SelectOption
