@module("demo") @react.component
external make: (
  ~width: CommonTypes.stringOrNumber=?,
  ~tags: CommonTypes.stringOrStringArray=?,
  ~checked: CommonTypes.boolOrIndeterminate=?,
  ~itemHeight: CommonTypes.unboxedUnionsItemHeight=?,
) => React.element = "UnboxedUnions"
