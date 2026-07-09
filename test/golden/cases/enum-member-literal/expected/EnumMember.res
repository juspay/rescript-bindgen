@module("demo") @react.component
external make: (
  ~one: EnumMemberLiteralTypes.sm,
  ~two: EnumMemberLiteralTypes.a,
  ~anySize: EnumMemberLiteralTypes.size,
  ~anyMode: EnumMemberLiteralTypes.mode,
) => React.element = "EnumMember"
