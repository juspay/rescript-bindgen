type props = {
  point?: RecordsTypes.recordsPointConfig,
  menu?: RecordsTypes.menuItemType,
  config?: RecordsTypes.recordsConfigConfig,
}

@module("demo")
external make: React.component<props> = "Records"
