type orientation =
  | @as("up") Up
  | @as("down") Down
  | @as("left") Left
  | @as("right") Right
type dropdownOption = {
  value: float,
  label: string,
  disabled: bool,
}
type chevronConfig = {
  className?: string,
  style?: JsxDOM.style,
  size?: float,
  disabled?: bool,
  orientation?: orientation,
}
