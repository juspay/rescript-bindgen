type t = InstanceTypes.tupleCtor
@send external info: (t, ~message: string) => unit = "info"
