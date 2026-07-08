type extra3 = {
  e3: string,
}
type extra2 = {
  e2: string,
  deeper?: extra3,
}
type extra1 = {
  e1: string,
  deeper?: extra2,
}
type deepTip = {
  enabled?: bool,
  padding?: float,
  mode?: string,
  count?: int,
  label?: string,
  payload?: JSON.t,
  formatter?: float => string,
  extra?: extra1,
  data?: array<JSON.t>,
  points?: array<float>,
  pair?: array<float>,
  custom?: Dict.t<JSON.t>,
  ratios?: Dict.t<float>,
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
