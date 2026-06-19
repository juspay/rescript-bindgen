type position =
  | @as("top") Top
  | @as("bottom") Bottom
type dropdown = {
  id: string,
  label: string,
  position: position,
}
module Dropdown = {
  type t
  external fromDropdown: dropdown => t = "%identity"
  external fromDropdowns: array<dropdown> => t = "%identity"
}
