type props<'a> = {
  items: array<'a>,
  renderItem: ('a, float) => React.element,
}

@module("demo")
external make: React.component<props<'a>> = "VirtualList"
