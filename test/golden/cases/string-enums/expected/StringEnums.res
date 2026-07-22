type props = {
  size?: StringEnumsTypes.stringEnumsSize,
  variant?: StringEnumsTypes.stringEnumsVariant,
  @as("type") type_?: StringEnumsTypes.htmlInputTypeAttribute,
}

@module("demo")
external make: React.component<props> = "StringEnums"
