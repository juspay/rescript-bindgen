@module("demo") @react.component
external make: (
  ~allowChartUpdate: bool=?,
  ~containerProps: Dict.t<'a>=?,
  ~immutable: bool=?,
  ~options: ForwardrefNestedOmitTypes.forwardrefNestedOmitOptionsConfig=?,
  ~className: string=?,
  ~style: ForwardrefNestedOmitTypes.forwardrefNestedOmitStyleConfig=?,
  ~callback: string => unit=?,
) => React.element = "FlatChart"
