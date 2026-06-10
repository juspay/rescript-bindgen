@module("@juspay/blend-design-system") @react.component
external make: (
  ~steps: array<StepperTypes.step>,
  ~onStepClick: float => unit=?,
  ~onSubstepClick: (float, float) => unit=?,
  ~clickable: bool=?,
  ~stepperType: StepperTypes.stepperType=?,
) => React.element = "Stepper"
