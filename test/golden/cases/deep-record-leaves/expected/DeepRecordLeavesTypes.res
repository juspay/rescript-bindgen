type deepTip = {
  enabled?: bool,
  padding?: float,
  mode?: string,
  count?: int,
  label?: string,
  payload?: JSON.t,
  formatter?: string,  // ⚪ loose — was `(value: number) => string`
  extra?: string,  // ⚪ loose — was `Extra1`
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
