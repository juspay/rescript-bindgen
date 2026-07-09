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
  external asDropdown: t => (dropdown) = "%identity"
  external fromDropdowns: array<dropdown> => t = "%identity"
  external asDropdowns: t => (array<dropdown>) = "%identity"
}
