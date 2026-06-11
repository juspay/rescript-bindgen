@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~children: React.element=?,  // ⓘ function form of this render prop is not bound — pass a React element
) => React.element = "Value"
