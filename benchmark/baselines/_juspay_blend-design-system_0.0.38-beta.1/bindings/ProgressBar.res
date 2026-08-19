type props = {
  value: float,
  size?: ProgressBarTypes.progressBarSize,
  variant?: ProgressBarTypes.progressBarVariant,
  @as("type") type_?: ProgressBarTypes.progressBarType,
  showLabel?: bool,
  min?: float,
  max?: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ProgressBar"
