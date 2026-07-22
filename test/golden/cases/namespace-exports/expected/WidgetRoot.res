type props = {
  @as("open") open_?: bool,
}

@module("demo") @scope("Widget")
external make: React.component<props> = "Root"
