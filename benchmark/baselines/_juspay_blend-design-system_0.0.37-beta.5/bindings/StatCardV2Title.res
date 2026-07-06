@module("@juspay/blend-design-system") @react.component
external make: (
  ~title: string,
  ~helpIconText: string=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~id: string=?,
) => React.element = "StatCardV2Title"
