type props = {
  rows: Nullable.t<array<NullableFieldsTypes.row>>,
  data: NullableFieldsTypes.panelData,
  caption?: string,
  span?: Nullable.t<CommonTypes.stringOrNumber>,
  onPick?: Nullable.t<CommonTypes.stringOrNumber> => unit,
}

@module("demo")
external make: React.component<props> = "Panel"
