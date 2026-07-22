type props = {
  title?: string,
  @as("open") open_?: bool,
}

@module("demo")
external make: React.component<props> = "Plain"
