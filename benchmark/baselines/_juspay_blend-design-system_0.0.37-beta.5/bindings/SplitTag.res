@module("@juspay/blend-design-system") @react.component
external make: (
  ~primaryTag: TagsTypes.tagsPrimaryTagConfig,
  ~secondaryTag: TagsTypes.tagsPrimaryTagConfig=?,
  ~size: TagsTypes.tagSize=?,
  ~shape: TagsTypes.tagShape=?,
) => React.element = "SplitTag"
