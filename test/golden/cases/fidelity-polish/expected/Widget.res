/** zero-cost wrapper: pass the FUNCTION form of `render` — `render={renderFn((…) => …)}` */
external renderFn: ((JSON.t, JSON.t) => React.element) => React.element = "%identity"

type props = {
  value?: Nullable.t<float>,
  count?: int,
  render?: React.element,  // ⓘ function form: wrap with `renderFn` (zero-cost)
  inputRef?: React.ref<Nullable.t<Dom.element>>,
  anyRef?: React.ref<Nullable.t<Dom.element>>,
}

@module("demo")
external make: React.component<props> = "Widget"
