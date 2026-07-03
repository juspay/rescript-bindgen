@module("demo") @react.component
external make: (
  ~items: array<'a>,
  ~render: 'a => StyledConcreteSignatureTypes.jsxElement,
) => React.element = "Generic"
