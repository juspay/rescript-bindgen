type point = {
  x: float,
  y: float,
  name?: string,
}
type tooltip = {
  shared?: bool,
}
type chartOpts = {
  formatter?: @this ((point, tooltip) => string),
}
type rec widgetOpts = {
  formatter?: @this ((point, widget) => string),
}
and w5 = {
  opts?: widgetOpts,
  s5?: string,
}
and w4 = {
  w5?: w5,
  s4?: string,
}
and w3 = {
  w4?: w4,
  s3?: string,
}
and w2 = {
  w3?: w3,
  s2?: string,
}
and w1 = {
  w2?: w2,
  s1?: string,
}
and widget = {
  chain?: w1,
  id?: string,
}
