@module("demo") @react.component
external make: (
  ~value: array<'a>=?,
  ~defaultValue: array<'a>=?,
  ~onValueChange: array<'a> => unit=?,
  ~tag: 'b=?,
  ~other: 'c=?,
  ~meta: AnyToTypevarTypes.widgetMeta=?,
) => React.element = "Widget"
