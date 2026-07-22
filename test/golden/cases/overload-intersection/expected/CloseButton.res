type props = {
  closeToast: CommonTypes.CloseToastFunc.t,  // ⓘ was overloaded `CloseToastFunc` (2 call signatures) — opaque; view with CloseToastFunc.asReason / CloseToastFunc.asMouse
}

@module("demo")
external make: React.component<props> = "CloseButton"
