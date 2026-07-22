/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: ('a => React.element) => React.element = "%identity"

type props = {
  children?: React.element,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
}

@module("@base-ui-components/react") @scope("Combobox")
external make: React.component<props> = "Value"
