/** zero-cost wrapper: pass the FUNCTION form of `children` — `children={childrenFn((…) => …)}` */
external childrenFn: (string => React.element) => React.element = "%identity"

@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~children: React.element=?,  // ⓘ function form: wrap with `childrenFn` (zero-cost)
) => React.element = "Value"
