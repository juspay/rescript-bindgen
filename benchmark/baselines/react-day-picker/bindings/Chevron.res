@module("react-day-picker") @react.component
external make: (
  ~className: string=?,
  ~style: JsxDOM.style=?,
  ~size: float=?,
  ~disabled: bool=?,
  ~orientation: ComponentsTypes.componentsOrientation=?,
) => React.element = "Chevron"
