type props = {
  label?: string,
}

@module("demo") @scope("Widget")
external make: React.component<props> = "Item"
