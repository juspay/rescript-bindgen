@module("@juspay/blend-design-system") @react.component
external make: (
  ~title: string=?,
  ~subtitle: string=?,
  ~slot: React.element=?,
  ~button: HighchartsSharedTypes.buttonProps=?,
) => React.element = "ChartV2NoData"
