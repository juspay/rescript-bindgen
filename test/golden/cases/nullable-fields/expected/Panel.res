@module("demo") @react.component
external make: (
  ~rows: Nullable.t<array<NullableFieldsTypes.row>>,
  ~data: NullableFieldsTypes.panelData,
  ~caption: string=?,
) => React.element = "Panel"
