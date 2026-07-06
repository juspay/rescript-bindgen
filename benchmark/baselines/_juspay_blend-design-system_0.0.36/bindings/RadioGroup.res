@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string=?,
  ~label: string=?,
  ~name: string,
  ~defaultValue: string=?,
  ~value: string=?,
  ~children: React.element,
  ~onChange: string => unit=?,
  ~disabled: bool=?,
  ~required: bool=?,
  ~error: bool=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "RadioGroup"
