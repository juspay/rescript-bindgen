type textColumn = {
  field: string,
  label: string,
  width: float,
  sortable: bool,
  maxChars: float,
}
type numberColumn = {
  field: string,
  label: string,
  width: float,
  sortable: bool,
  precision: float,
}
type dateColumn = {
  field: string,
  label: string,
  width: string,
  sortable?: bool,
  icon: string,
}
module UnionSharedArmGettersColumn = {
  type t
  external fromTextColumn: textColumn => t = "%identity"
  external asTextColumn: t => (textColumn) = "%identity"
  external fromNumberColumn: numberColumn => t = "%identity"
  external asNumberColumn: t => (numberColumn) = "%identity"
  external fromDateColumn: dateColumn => t = "%identity"
  external asDateColumn: t => (dateColumn) = "%identity"
  @get external field: t => string = "field"
  @get external label: t => string = "label"
}
