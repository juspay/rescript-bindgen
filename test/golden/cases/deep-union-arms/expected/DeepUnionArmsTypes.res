type shadowOpts = {
  color?: string,
  offsetX?: float,
  width?: float,
}
@unboxed type boolOrShadowOpts = Bool(bool) | ShadowOpts(shadowOpts)
type mark = {
  x?: float,
  label?: string,
}
@unboxed type markOrMarkArray = Mark(mark) | MarkArr(array<mark>)
type widthOpts = {
  min?: float,
  max?: float,
}
type deepTip = {
  shadow?: boolOrShadowOpts,
  marks?: markOrMarkArray,
  width?: widthOpts,
  enabled?: bool,
}
type l6 = {
  tip?: deepTip,
  s6?: string,
}
type l5 = {
  l6?: l6,
  s5?: string,
}
type l4 = {
  l5?: l5,
  s4?: string,
}
type l3 = {
  l4?: l4,
  s3?: string,
}
type l2 = {
  l3?: l3,
  s2?: string,
}
type l1 = {
  l2?: l2,
  s1?: string,
}
