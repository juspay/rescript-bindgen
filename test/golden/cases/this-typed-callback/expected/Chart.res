type props = {
  formatter?: @this ((ThisTypedCallbackTypes.point, ThisTypedCallbackTypes.tooltip) => string),
  onLabel?: @this ((ThisTypedCallbackTypes.point) => string),
  onSimple?: float => unit,
  opts?: ThisTypedCallbackTypes.chartOpts,
  widget?: ThisTypedCallbackTypes.widget,
}

@module("demo")
external make: React.component<props> = "Chart"
