type props = {
  count: int,
  label?: string,
}

@module("demo")
external make: React.component<props> = "Badge"
