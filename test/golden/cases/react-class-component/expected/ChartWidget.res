type t = InstanceTypes.chartWidget
@new @module("demo") external make: (~options: ReactClassComponentTypes.reactClassComponentOptionsConfig) => t = "ChartWidget"
@send external render: (t) => ReactClassComponentTypes.jsxElement = "render"
@send external destroy: (t) => unit = "destroy"
