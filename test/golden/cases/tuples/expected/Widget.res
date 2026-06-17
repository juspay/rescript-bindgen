@module("demo") @react.component
external make: (
  ~offset: (float, float)=?,
  ~pair: (string, float)=?,
  ~variadic: string=?,  // ⚪ loose — was `[number, ...string[]]`
  ~optionalEl: string=?,  // ⚪ loose — was `[number, number?]`
  ~single: string=?,  // ⚪ loose — was `[number]`
) => React.element = "Widget"
