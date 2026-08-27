type props = {
  value: string,
  title: string,
  subtext?: string,
  @as("type") type_?: RecordPropsTypes.recordPropsType,
  weird?: RecordPropsTypes.RecordPropsWeird.t,  // ⓘ was `string | { a: 1; } | { b: 2; }` — opaque; build with RecordPropsWeird.fromString / RecordPropsWeird.fromRecordPropsWeirdConfig / RecordPropsWeird.fromRecordPropsWeirdConfig2
  pattern?: string,  // ⚪ loose — was ``prefix-${string}``
}

@module("demo")
external make: React.component<props> = "AccordionItem"
