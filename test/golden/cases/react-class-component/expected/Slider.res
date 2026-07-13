@module("demo") @react.component
external make: (
  ~value: float,
  ~onChange: float => unit=?,
  ~disabled: bool=?,
) => React.element = "Slider"
