type props = {
  offset?: (float, float),
  pair?: (string, float),
  variadic?: string,  // ⚪ loose — was `[number, ...string[]]`
  optionalEl?: string,  // ⚪ loose — was `[number, number?]`
  single?: array<float>,
}

@module("demo")
external make: React.component<props> = "Widget"
