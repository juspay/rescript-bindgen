@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~children: ('a, float) => React.element,
) => React.element = "Collection"
