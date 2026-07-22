type props = {
  maxWidth?: string,
  variant?: DiscriminatedUnionPropsTypes.discriminatedUnionPropsVariant,
  title?: string,
  content?: string,
  alignment?: DiscriminatedUnionPropsTypes.discriminatedUnionPropsAlignment,
  centerAlign?: bool,
  children?: string,
}

@module("demo")
external make: React.component<props> = "Card"
