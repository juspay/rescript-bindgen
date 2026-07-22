type props = {
  children: CommonTypes.stringOrNumber,
  label?: string,
}

@module("demo")
external make: React.component<props> = "Tab"
