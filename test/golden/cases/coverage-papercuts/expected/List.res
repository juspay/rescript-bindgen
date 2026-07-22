type props = {
  items: array<CommonTypes.stringOrNumber>,
}

@module("demo")
external make: React.component<props> = "List"
