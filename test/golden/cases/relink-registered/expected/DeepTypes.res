type series = {
  events?: ComponentsTypes.eventsObj,
  name?: string,
}
type l6 = {
  series?: series,
  s6?: string,
}
type l5 = {
  l6?: l6,
}
type l4 = {
  l5?: l5,
}
type l3 = {
  l4?: l4,
}
type l2 = {
  l3?: l3,
}
type l1 = {
  l2?: l2,
}
