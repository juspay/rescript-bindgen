@module("@juspay/blend-design-system") @react.component
external make: (
  ~label: string=?,
  ~id: string=?,
  ~name: string=?,
  ~checked: CommonTypes.boolOrIndeterminate=?,
  ~defaultChecked: bool=?,
  ~onCheckedChange: CommonTypes.boolOrIndeterminate => unit=?,
  ~disabled: bool=?,
  ~required: bool=?,
  ~error: bool=?,
  ~size: CheckboxTypes.checkboxSize=?,
  ~children: React.element=?,
  ~subtext: string=?,
  ~slot: React.element=?,
  ~maxLength: CheckboxTypes.checkboxMaxLengthConfig=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Checkbox"
