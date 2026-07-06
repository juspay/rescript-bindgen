@module("@juspay/blend-design-system") @react.component
external make: (
  ~steps: array<StepperTypes.step>,
  ~onStepClick: float => unit=?,
  ~onSubstepClick: (float, float) => unit=?,
  ~clickable: bool=?,
  ~stepperType: StepperTypes.stepperType=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Stepper"
