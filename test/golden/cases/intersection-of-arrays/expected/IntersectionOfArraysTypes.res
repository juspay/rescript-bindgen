type item = {
  value: string,
  label: string,
}
type group = {
  groupLabel?: string,
  items: array<item>,
}
type intersectionOfArraysDataItemsConfig = {
  value: string,
  label: string,
  nestedItems?: array<group>,
}
type intersectionOfArraysDataConfig = {
  groupLabel?: string,
  items: array<intersectionOfArraysDataItemsConfig>,
}
