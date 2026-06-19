@module("demo") @react.component
external make: (
  ~data: array<'a>,
  ~idField: string,
  ~onRowClick: ('a, float) => unit=?,
  ~onSave: (JSON.t, 'a) => unit=?,
  ~filterComponent: React.component<GenericsTypes.rowFilterProps>=?,
) => React.element = "DataTable"
