type props = {
  bordered?: bool,
}

@module("demo")
external make: React.component<props> = "Table"

// Compound statics — zero-cost aliases; use <Table.Summary />
module Summary = TableSummary
