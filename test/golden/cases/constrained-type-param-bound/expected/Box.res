type t = InstanceTypes.box
@new @module("demo") external make: (~value: string) => t = "Box"
@get external size: t => float = "size"
