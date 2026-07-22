type props<'a> = {
  items: array<'a>,
  render: 'a => StyledConcreteSignatureTypes.jsxElement,
}

@module("demo")
external make: React.component<props<'a>> = "Generic"
