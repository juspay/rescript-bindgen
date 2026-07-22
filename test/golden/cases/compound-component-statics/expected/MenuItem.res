type props = {
  label: string,
}

@module("demo") @scope("Menu")
external make: React.component<props> = "Item"
