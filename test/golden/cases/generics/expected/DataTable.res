type props<'a> = {
  data: array<'a>,
  idField: string,
  onRowClick?: ('a, float) => unit,
  onSave?: (JSON.t, 'a) => unit,
  filterComponent?: React.component<GenericsTypes.rowFilterProps>,
}

@module("demo")
external make: React.component<props<'a>> = "DataTable"
