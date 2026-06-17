@module("demo") @react.component
external make: (
  ~rows: Nullable.t<array<NullableFieldsTypes.row>>,
  ~data: NullableFieldsTypes.panelData,
  ~caption: string=?,
  ~span: Nullable.t<CommonTypes.stringOrNumber>=?,
  ~onPick: Nullable.t<CommonTypes.stringOrNumber> => unit=?,
) => React.element = "Panel"
