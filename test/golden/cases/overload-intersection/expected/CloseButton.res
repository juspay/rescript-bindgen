@module("demo") @react.component
external make: (
  ~closeToast: CommonTypes.CloseToastFunc.t,  // ⓘ was overloaded `CloseToastFunc` (2 call signatures) — opaque; view with CloseToastFunc.asReason / CloseToastFunc.asMouse
) => React.element = "CloseButton"
