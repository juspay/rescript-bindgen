@module("demo") @react.component
external make: (
  ~className: CommonTypes.className=?,
  ~formAction: CommonTypes.formAction<'a>=?,
  ~weirdCb: CommonTypes.weirdCb<'a>=?,
) => React.element = "Widget"
