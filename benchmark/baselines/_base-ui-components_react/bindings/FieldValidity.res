type props = {
  children: ValidityTypes.fieldValidityState => React.element,
}

@module("@base-ui-components/react") @scope("Field")
external make: React.component<props> = "Validity"
