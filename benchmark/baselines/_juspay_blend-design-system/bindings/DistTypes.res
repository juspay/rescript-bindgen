type direction =
  | @as("ltr") Ltr
  | @as("rtl") Rtl
type direction2 =
  | @as("ltr") Ltr
  | @as("rtl") Rtl
type highchartsReactRefObject<'b> = {
  chart: HighchartsSharedTypes.chart<'b>,
  container: React.ref<Nullable.t<Dom.htmlDivElement>>,
}
