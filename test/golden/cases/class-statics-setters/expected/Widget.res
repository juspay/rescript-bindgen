type t = InstanceTypes.widget
@new @module("demo") external make: (~id: string) => t = "Widget"
@send external refresh: (t) => unit = "refresh"
@get external value: t => float = "value"
@get external id: t => string = "id"
@set external valueSet: (t, float) => unit = "value"
@module("demo") @scope("Widget") external create: (~id: string) => t = "create"
@module("demo") @scope("Widget") external reset: unit => unit = "reset"
@module("demo") @scope("Widget") external version: string = "VERSION"
