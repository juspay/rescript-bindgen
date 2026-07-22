type props = {
  children?: React.element,
  title?: string,
}

@module("demo")
external make: React.component<props> = "Panel"
