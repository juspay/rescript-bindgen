type props = {
  height: float,
}

@module("demo") @scope(("Table", "Summary"))
external make: React.component<props> = "Row"
