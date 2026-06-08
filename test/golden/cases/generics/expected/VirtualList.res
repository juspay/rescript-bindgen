@module("demo") @react.component
external make: (
  ~items: array<'a>,
  ~renderItem: ('a, float) => React.element,
) => React.element = "VirtualList"
