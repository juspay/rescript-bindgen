type props = {
  title: string,
  value: CommonTypes.stringOrNumber,
  valueTooltip?: React.element,
  change?: Nullable.t<StatCardTypes.statCardChange>,
  subtitle?: string,
  variant: StatCardTypes.statCardVariant,
  chartData?: array<StatCardTypes.chartDataPoint>,
  progressValue?: float,
  titleIcon?: React.element,
  actionIcon?: React.element,
  helpIconText?: string,
  dropdownProps?: SingleSelectTypes.singleSelectProps,
  maxWidth?: string,
  minWidth?: string,
  xAxis?: StatCardTypes.statCardAxisConfig,
  yAxis?: StatCardTypes.statCardAxisConfig,
  valueFormatter?: HighchartsSharedTypes.axisType,
  height?: string,
  direction?: StatCardTypes.statCardDirection,
  skeleton?: StatCardTypes.statCardSkeletonProps,
  dataDisplay?: bool,
  showBorder?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCard"
