type opts = {
  retries?: float,
}
module Wrap = {
  type t
  external asFn: t => (string => string) = "%identity"
  @get external size: t => CommonTypes.stringOrNumber = "size"
}
module SigWrap = {
  type t
  external asFn: t => (CommonTypes.stringOrNumber => string) = "%identity"
  @get external label: t => CommonTypes.stringOrNumber = "label"
}
module Client = {
  type t
  external asFn: t => (string => string) = "%identity"
  @get external opts: t => opts = "opts"
}
