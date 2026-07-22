type props = {
  label: string,
  caption?: string,
}

@module("demo")
external make: React.component<props> = "Widget"
