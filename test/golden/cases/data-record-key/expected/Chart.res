type props = {
  series?: array<DataRecordKeyTypes.dataRecordKeySeriesConfig>,
}

@module("demo")
external make: React.component<props> = "Chart"
