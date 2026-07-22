type props = {
  value: string,
  title: string,
  subtext?: string,
  @as("type") type_?: RecordPropsTypes.recordPropsType,
  weird?: string,  // ⚪ loose — was `string | { a: 1; } | { b: 2; }`
}

@module("demo")
external make: React.component<props> = "AccordionItem"
