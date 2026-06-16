type row = {
  id: string,
}
type panelData = {
  data: Nullable.t<array<row>>,
  activeKeys: Nullable.t<array<string>>,
  note?: string,
  subtitle?: string,
}
