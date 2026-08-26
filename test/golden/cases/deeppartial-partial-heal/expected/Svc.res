type t = InstanceTypes.svc
@new @module("demo") external make: unit => t = "Svc"
// ⚪ loose: `ambiguous` has a param/return widened to `string`.
@send external ambiguous: (t, ~name: string) => DeeppartialPartialHealTypes.ordTaggedCs7n2 = "ambiguous"
@send external unambiguous: (t) => DeeppartialPartialHealTypes.ordTaggedJst4h = "unambiguous"
