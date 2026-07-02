@module("demo") @react.component
external make: (
  ~className: CommonTypes.emptyStateAndSalvageClassName=?,
  ~formAction: CommonTypes.emptyStateAndSalvageFormAction<'a>=?,
  ~weirdCb: CommonTypes.emptyStateAndSalvageWeirdCb<'a>=?,
) => React.element = "Widget"
