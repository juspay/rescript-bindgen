type props = {
  className?: string,
  style?: JsxDOM.style,
  size?: float,
  disabled?: bool,
  orientation?: ComponentsTypes.componentsOrientation,
}

@module("react-day-picker")
external make: React.component<props> = "Chevron"
