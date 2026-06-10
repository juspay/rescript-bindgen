@module("@base-ui-components/react") @react.component
external make: (
  ~children: React.element=?,
  ~direction: DirectionProviderTypes.textDirection=?,
) => React.element = "DirectionProvider"
