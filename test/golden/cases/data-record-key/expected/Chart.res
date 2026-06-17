@module("demo") @react.component
external make: (
  ~series: array<DataRecordKeyTypes.dataRecordKeySeriesConfig>=?,
) => React.element = "Chart"
