@module("demo") @scope("Table") @react.component
external make: (
  ~fixed: bool=?,
) => React.element = "Summary"

// Compound statics — zero-cost aliases; use <TableSummary.Row />
module Row = TableSummaryRow
