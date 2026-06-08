@module("demo") @react.component
external make: (
  @as("aria-checked") ~ariaChecked: [#"true" | #"false" | #mixed]=?,
  @as("aria-disabled") ~ariaDisabled: bool=?,
  @as("aria-level") ~ariaLevel: int=?,
  ~role: string=?,
) => React.element = "Aria"
