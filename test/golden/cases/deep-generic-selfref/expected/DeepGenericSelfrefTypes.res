type rec chartInstance = {
  options?: options,
  id?: string,
}
and series = {
  chart?: chartInstance,
  kind?: string,
}
and options = {
  series?: array<series>,
  width?: float,
}
type l3 = {
  opts?: options,
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
