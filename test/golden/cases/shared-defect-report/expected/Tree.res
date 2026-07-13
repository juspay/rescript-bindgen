@module("demo") @react.component
external make: (
  ~root: SharedDefectReportTypes.treeNode=?,
) => React.element = "Tree"
