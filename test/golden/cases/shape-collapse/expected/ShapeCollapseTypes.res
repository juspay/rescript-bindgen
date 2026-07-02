type shapeCollapseDropdownPosition =
  | @as("top") Top
  | @as("bottom") Bottom
type dropdown = {
  id: string,
  label: string,
  position: shapeCollapseDropdownPosition,
}
module ShapeCollapseDropdown = {
  type t
  external fromDropdown: dropdown => t = "%identity"
  external fromDropdowns: array<dropdown> => t = "%identity"
}
