@module("demo") @react.component
external make: (
  ~allowChartUpdate: bool=?,
  ~containerProps: Dict.t<'a>=?,
  ~immutable: bool=?,
  ~options: ForwardrefNestedOmitTypes.forwardrefNestedOmitOptionsConfig=?,
  ~callback: string => unit=?,
  ~skeleton: ForwardrefNestedOmitTypes.skeletonProps=?,
  ~noData: bool=?,
) => React.element = "Chart"
