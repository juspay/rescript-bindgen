type t = InstanceTypes.widget
@new @module("demo") external make: unit => t = "Widget"
@send external ping: (t) => float = "ping"
@set external configSet: (t, ClassSetterStaticReachableTypes.onlyViaSetter) => unit = "config"
@module("demo") @scope("Widget") external build: (~opts: ClassSetterStaticReachableTypes.onlyViaStatic) => t = "build"
