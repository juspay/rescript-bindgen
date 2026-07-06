@module("@juspay/blend-design-system") @react.component
external make: (
  ~value: float,
  ~size: ProgressBarTypes.progressBarSize=?,
  ~variant: ProgressBarTypes.progressBarVariant=?,
  @as("type") ~type_: ProgressBarTypes.progressBarType=?,
  ~showLabel: bool=?,
  ~min: float=?,
  ~max: float=?,
) => React.element = "ProgressBar"
