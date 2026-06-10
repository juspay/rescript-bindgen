@module("react-day-picker") @react.component
external make: (
  ~className: string=?,
  ~style: JsxDOM.style=?,
  ~size: int=?,
  ~disabled: bool=?,
  ~orientation: ComponentsTypes.orientation=?,
) => React.element = "Chevron"
