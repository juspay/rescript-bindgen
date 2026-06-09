type t = InstanceTypes.store
@new @module("demo") external make: (~label: string) => t = "Store"
@send external register: (t, ~reg: ClassTypeCycleTypes.registry) => unit = "register"
@send external snapshot: (t) => ClassTypeCycleTypes.registry = "snapshot"
