@module("demo") @react.component
external make: (
  ~bordered: bool=?,
) => React.element = "Table"

// Compound statics — zero-cost aliases; use <Table.Summary />
module Summary = TableSummary
