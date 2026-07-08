type htmlInputTypeAttribute =
  | @as("number") Number
  | @as("color") Color
  | @as("button") Button
  | @as("search") Search
  | @as("time") Time
  | @as("image") Image
  | @as("text") Text
  | @as("hidden") Hidden
  | @as("checkbox") Checkbox
  | @as("radio") Radio
  | @as("reset") Reset
  | @as("range") Range
  | @as("date") Date
  | @as("submit") Submit
  | @as("tel") Tel
  | @as("url") Url
  | @as("email") Email
  | @as("datetime-local") DatetimeLocal
  | @as("file") File
  | @as("month") Month
  | @as("password") Password
  | @as("week") Week
type htmlAttributeAnchorTarget =
  | @as("_self") Self
  | @as("_blank") Blank
  | @as("_parent") Parent
  | @as("_top") Top
type refObject = {
  ...JsxDOM.domProps,
}
