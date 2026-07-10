type direction =
  | @as("ltr") Ltr
  | @as("rtl") Rtl
type highchartsReactRefObject<'a, 'b, 'c> = {
  chart: HighchartsSharedTypes.chart<'a, 'b, 'c>,
  container: React.ref<Nullable.t<Dom.htmlDivElement>>,
}
