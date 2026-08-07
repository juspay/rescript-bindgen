type props = {
  id?: string,
  value?: string,
  checked?: bool,
  defaultChecked?: bool,
  onChange?: ReactEvent.Form.t => unit,
  disabled?: bool,
  required?: bool,
  error?: bool,
  size?: RadioTypes.radioSize,
  children?: React.element,
  subtext?: string,
  slot?: React.element,
  name?: string,
  maxLength?: RadioTypes.radioMaxLengthConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Radio"
