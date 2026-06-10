type orientation =
  | @as("up") Up
  | @as("down") Down
  | @as("left") Left
  | @as("right") Right
type type_ =
  | @as("button") Button
  | @as("submit") Submit
  | @as("reset") Reset
type dropdownOption = {
  value: float,
  label: string,
  disabled: bool,
}
type chevronConfig = {
  className?: string,
  style?: JsxDOM.style,
  size?: int,
  disabled?: bool,
  orientation?: orientation,
}
