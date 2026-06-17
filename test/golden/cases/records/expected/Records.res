@module("demo") @react.component
external make: (
  ~point: RecordsTypes.recordsPointConfig=?,
  ~menu: RecordsTypes.menuItemType=?,
  ~config: RecordsTypes.recordsConfigConfig=?,
) => React.element = "Records"
