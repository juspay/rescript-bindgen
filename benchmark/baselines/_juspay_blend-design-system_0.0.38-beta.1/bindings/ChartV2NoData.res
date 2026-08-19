type props = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonTypes.buttonProps,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartV2NoData"
