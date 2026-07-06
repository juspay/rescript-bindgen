@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string=?,
  ~label: string=?,
  ~name: string=?,
  ~children: React.element,
  ~disabled: bool=?,
  ~value: array<string>=?,
  ~defaultValue: array<string>=?,
  ~onChange: array<string> => unit=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SwitchGroup"
