@module("demo") @react.component
external make: (
  ~series: array<DataRecordKeyTypes.seriesConfig>=?,
) => React.element = "Chart"
