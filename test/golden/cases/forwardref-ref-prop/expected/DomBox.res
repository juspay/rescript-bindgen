type props = {
  title?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("demo")
external make: React.component<props> = "DomBox"
