type pointConfig = {
  x: float,
  y: float,
}
type rec menuItemType = {
  label: string,
  value: string,
  subItems?: array<menuItemType>,
}
type configConfig = {
  id?: string,
  className?: string,
}
