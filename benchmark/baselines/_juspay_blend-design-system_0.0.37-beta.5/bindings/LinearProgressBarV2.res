type props = {
  ...ProgressBarV2Types.progressBarV2InternalProps,
  size: ProgressBarV2Types.progressBarV2Size,
  appearance: ProgressBarV2Types.progressBarV2Appearance,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "LinearProgressBarV2"
