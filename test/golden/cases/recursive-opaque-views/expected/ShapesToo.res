type props = {
  other?: string,  // ⚪ loose — was `Shape`
}

@module("demo")
external make: React.component<props> = "ShapesToo"
