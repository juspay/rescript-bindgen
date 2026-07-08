type d4 = {
  v: string,
}
type d3 = {
  d4?: d4,
}
type d2 = {
  d3?: d3,
}
type d1 = {
  d2?: d2,
}
type eventsObj = {
  click?: string => unit,
  nested?: d1,
}
