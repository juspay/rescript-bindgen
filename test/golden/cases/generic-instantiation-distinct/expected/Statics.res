type t = InstanceTypes.statics
@new @module("demo") external make: unit => t = "Statics"
// ⚪ loose: `digitStatic` has a param/return widened to `string`.
@module("demo") @scope("Statics") external digitStatic: (~name: string) => string = "digitStatic"
