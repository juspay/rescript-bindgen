@module("demo") @react.component
external make: (
  ~formatter: @this ((ThisTypedCallbackTypes.point, ThisTypedCallbackTypes.tooltip) => string)=?,
  ~onLabel: @this ((ThisTypedCallbackTypes.point) => string)=?,
  ~onSimple: float => unit=?,
  ~opts: ThisTypedCallbackTypes.chartOpts=?,
) => React.element = "Chart"
