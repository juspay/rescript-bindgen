type props = {
  inputRef: React.ref<Nullable.t<Dom.element>>,
  value: string,
  onChange: ReactEvent.Form.t => unit,
  placeholder?: string,
  ariaLabel?: string,
  onArrowKeyToFirstOption?: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuSearch"
