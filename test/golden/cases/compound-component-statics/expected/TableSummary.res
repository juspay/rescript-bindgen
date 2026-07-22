type props = {
  fixed?: bool,
}

@module("demo") @scope("Table")
external make: React.component<props> = "Summary"

// Compound statics — zero-cost aliases; use <TableSummary.Row />
module Row = TableSummaryRow
