type onPointOptions = {
  id?: string,
  x?: float,
  y?: float,
}
module ObjectConfigUnionOnPoint = {
  type t
  external fromJSON: JSON.t => t = "%identity"
  external asJSON: t => (JSON.t) = "%identity"
  external fromOnPointOptions: onPointOptions => t = "%identity"
  external asOnPointOptions: t => (onPointOptions) = "%identity"
}
