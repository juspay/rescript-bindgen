type props = {
  value: string,
  title: string,
  subtext?: string,
  @as("type") type_?: RecordPropsTypes.recordPropsType,
  weird?: RecordPropsTypes.RecordPropsWeird.t,
}

@module("demo")
external make: React.component<props> = "AccordionItem"
