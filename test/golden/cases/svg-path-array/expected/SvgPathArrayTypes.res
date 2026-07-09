type cmd =
  | @as("M") M
  | @as("L") L
  | @as("C") C
  | @as("Z") Z
module Seg = {
  type t
  external fromCmds: array<cmd> => t = "%identity"
  external asCmds: t => (array<cmd>) = "%identity"
  external fromTuple2: ((cmd, float)) => t = "%identity"
  external asTuple2: t => ((cmd, float)) = "%identity"
  external fromTuple3: ((cmd, float, float)) => t = "%identity"
  external asTuple3: t => ((cmd, float, float)) = "%identity"
}
@unboxed type stringOrSegTArray = Str(string) | Arr(array<Seg.t>)
