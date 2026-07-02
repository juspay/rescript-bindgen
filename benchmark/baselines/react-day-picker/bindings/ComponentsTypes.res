type componentsOrientation =
  | @as("up") Up
  | @as("down") Down
  | @as("left") Left
  | @as("right") Right
type dropdownOption = {
  value: float,
  label: string,
  disabled: bool,
}
type componentsComponentsChevronConfig = {
  className?: string,
  style?: JsxDOM.style,
  size?: float,
  disabled?: bool,
  orientation?: componentsOrientation,
}
