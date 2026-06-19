@module("demo") @react.component
external make: (
  ~alwaysSelected: array<string>=?,
  ~idField: string=?,
  ~filteredProps: JsxDOM.domProps=?,
  ~dropdown: ShapeCollapseTypes.Dropdown.t=?,  // ⓘ was `Dropdown | Dropdown[]` — opaque; build with Dropdown.fromDropdown / Dropdown.fromDropdowns
) => React.element = "Widget"
