@module("@juspay/blend-design-system") @react.component
external make: (
  ~value: float,
  ~min: float,
  ~max: float,
  ~ariaLabel: string=?,
  ~ariaLabelledby: string=?,
  ~showLabel: bool,
  ~tokens: ProgressBarV2Types.progressBarV2TokenType,
  ~size: ProgressBarV2Types.progressBarV2Size,
  ~appearance: ProgressBarV2Types.progressBarV2Appearance,
) => React.element = "LinearProgressBarV2"
