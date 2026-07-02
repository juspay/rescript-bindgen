@module("demo") @react.component
external make: (
  ~maxWidth: string=?,
  ~variant: DiscriminatedUnionPropsTypes.discriminatedUnionPropsVariant=?,
  ~title: string=?,
  ~content: string=?,
  ~alignment: DiscriminatedUnionPropsTypes.discriminatedUnionPropsAlignment=?,
  ~centerAlign: bool=?,
  ~children: string=?,
) => React.element = "Card"
