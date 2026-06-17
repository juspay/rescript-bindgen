@module("demo") @react.component
external make: (
  ~items: array<RecordHtmlCollisionTypes.itemData>,
) => React.element = "List"
