@module("@juspay/blend-design-system") @react.component
external make: (
  ~primaryTag: HighchartsSharedTypes.tagsPrimaryTagConfig,
  ~secondaryTag: HighchartsSharedTypes.tagsPrimaryTagConfig=?,
  ~size: HighchartsSharedTypes.tagSize=?,
  ~shape: HighchartsSharedTypes.tagShape=?,
) => React.element = "SplitTag"
