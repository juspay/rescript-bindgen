@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string=?,
  ~checked: bool=?,
  ~defaultChecked: bool=?,
  ~onChange: bool => unit=?,
  ~disabled: bool=?,
  ~required: bool=?,
  ~error: bool=?,
  ~size: SwitchTypes.switchSize=?,
  ~label: string=?,
  ~subtext: string=?,
  ~slot: React.element=?,
  ~name: string=?,
  ~value: string=?,
  ~maxLength: SwitchTypes.switch_MaxLengthConfig=?,
) => React.element = "Switch"
