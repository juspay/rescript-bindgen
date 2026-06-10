@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string=?,
  ~value: string=?,
  ~checked: bool=?,
  ~defaultChecked: bool=?,
  ~onChange: ReactEvent.Form.t => unit=?,
  ~disabled: bool=?,
  ~required: bool=?,
  ~error: bool=?,
  ~size: RadioTypes.radioSize=?,
  ~children: React.element=?,
  ~subtext: string=?,
  ~slot: React.element=?,
  ~name: string=?,
  ~maxLength: CheckboxTypes.maxLengthConfig=?,
) => React.element = "Radio"
