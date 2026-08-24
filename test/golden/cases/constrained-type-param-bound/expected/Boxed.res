type t = InstanceTypes.boxed
@new @module("demo") external make: (~value: string) => t = "Boxed"
@get external size: t => float = "size"
