@module("demo") @react.component
external make: (
  ~config: SharedDefectReportTypes.config=?,
  ~label: string=?,
) => React.element = "Panel"
