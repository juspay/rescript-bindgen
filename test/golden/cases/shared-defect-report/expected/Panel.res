type props = {
  config?: SharedDefectReportTypes.config,
  label?: string,
}

@module("demo")
external make: React.component<props> = "Panel"
