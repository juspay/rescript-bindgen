type direction =
  | @as("ltr") Ltr
  | @as("rtl") Rtl
type direction2 =
  | @as("ltr") Ltr
  | @as("rtl") Rtl
type highchartsReactRefObject = {
  chart: HighchartsSharedTypes.chart,
  container: React.ref<Nullable.t<Dom.htmlDivElement>>,
}
