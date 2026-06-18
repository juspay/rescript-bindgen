type cmd =
  | @as("M") M
  | @as("L") L
  | @as("C") C
  | @as("Z") Z
module Seg = {
  type t
  external fromCmds: array<cmd> => t = "%identity"
  external fromTuple2: ((cmd, float)) => t = "%identity"
  external fromTuple3: ((cmd, float, float)) => t = "%identity"
}
@unboxed type stringOrSegTArray = Str(string) | Arr(array<Seg.t>)
