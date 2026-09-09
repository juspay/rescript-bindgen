@module("demo") external maybeLabel: (string) => option<string> = "maybeLabel"
@module("demo") external findThing: (array<NullableReturnTypes.thing>, string) => Nullable.t<NullableReturnTypes.thing> = "findThing"
@module("demo") external toCssValue: (~value: CommonTypes.stringOrNumber=?, unit) => option<string> = "toCssValue"
@module("demo") external requiredLabel: (string) => string = "requiredLabel"
