type t = InstanceTypes.variadicBox
@new @module("demo") @variadic external make: (~prefix: string, array<float>) => t = "VariadicBox"
@send @variadic external append: (t, ~separator: string, array<string>) => string = "append"
