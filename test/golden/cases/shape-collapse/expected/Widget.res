type props = {
  alwaysSelected?: array<string>,
  idField?: string,
  filteredProps?: JsxDOM.domProps,
  dropdown?: ShapeCollapseTypes.ShapeCollapseDropdown.t,  // ⓘ was `Dropdown | Dropdown[]` — opaque; build with ShapeCollapseDropdown.fromDropdown / ShapeCollapseDropdown.fromDropdowns
}

@module("demo")
external make: React.component<props> = "Widget"
