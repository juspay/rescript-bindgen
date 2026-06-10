type htmlInputTypeAttribute =
  | @as("number") Number
  | @as("hidden") Hidden
  | @as("color") Color
  | @as("submit") Submit
  | @as("reset") Reset
  | @as("button") Button
  | @as("checkbox") Checkbox
  | @as("radio") Radio
  | @as("search") Search
  | @as("date") Date
  | @as("time") Time
  | @as("image") Image
  | @as("text") Text
  | @as("tel") Tel
  | @as("url") Url
  | @as("email") Email
  | @as("datetime-local") DatetimeLocal
  | @as("file") File
  | @as("month") Month
  | @as("password") Password
  | @as("range") Range
  | @as("week") Week
type primaryActionButtonPropsConfig = {
  ...JsxDOM.domProps,
}
