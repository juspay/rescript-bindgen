@module("@base-ui-components/react") @react.component
external make: (
  ~children: ValidityTypes.fieldValidityState => React.element,
) => React.element = "FieldValidity"
