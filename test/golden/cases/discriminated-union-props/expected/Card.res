@module("demo") @react.component
external make: (
  ~maxWidth: string=?,
  ~variant: DiscriminatedUnionPropsTypes.variant=?,
  ~title: string=?,
  ~content: string=?,
  ~alignment: DiscriminatedUnionPropsTypes.alignment=?,
  ~centerAlign: bool=?,
  ~children: string=?,
) => React.element = "Card"
