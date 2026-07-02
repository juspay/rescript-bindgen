@module("demo") @react.component
external make: (
  ~alwaysSelected: array<string>=?,
  ~idField: string=?,
  ~filteredProps: JsxDOM.domProps=?,
  ~dropdown: ShapeCollapseTypes.ShapeCollapseDropdown.t=?,  // ⓘ was `Dropdown | Dropdown[]` — opaque; build with ShapeCollapseDropdown.fromDropdown / ShapeCollapseDropdown.fromDropdowns
) => React.element = "Widget"
