@module("@base-ui-components/react") @scope("Field") @react.component
external make: (
  ~children: ValidityTypes.fieldValidityState => React.element,
) => React.element = "Validity"
