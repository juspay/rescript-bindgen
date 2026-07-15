type animationOptionsObject = {
  complete?: JsFn.t,
  defer?: float,
  duration?: float,
  easing?: string,  // ⚠️ REVIEW — was `string | Function` — match the real type by hand
  step?: JsFn.t,
}
@unboxed type boolOrAnimationOptionsObject = Bool(bool) | AnimationOptionsObject(animationOptionsObject)
