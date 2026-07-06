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
