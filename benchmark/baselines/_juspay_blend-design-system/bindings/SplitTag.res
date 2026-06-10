@module("@juspay/blend-design-system") @react.component
external make: (
  ~primaryTag: TagsTypes.primaryTagConfig,
  ~secondaryTag: TagsTypes.primaryTagConfig=?,
  ~size: TagsTypes.tagSize=?,
  ~shape: TagsTypes.tagShape=?,
) => React.element = "SplitTag"
