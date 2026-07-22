type props = {
  one: EnumMemberLiteralTypes.sm,
  two: EnumMemberLiteralTypes.a,
  anySize: EnumMemberLiteralTypes.size,
  anyMode: EnumMemberLiteralTypes.mode,
}

@module("demo")
external make: React.component<props> = "EnumMember"
