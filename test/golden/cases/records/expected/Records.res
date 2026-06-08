@module("demo") @react.component
external make: (
  ~point: RecordsTypes.pointConfig=?,
  ~menu: RecordsTypes.menuItemType=?,
  ~config: RecordsTypes.configConfig=?,
) => React.element = "Records"
