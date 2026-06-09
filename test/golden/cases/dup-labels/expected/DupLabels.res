@module("demo") @react.component
external make: (
  ~node: DupLabelsTypes.treeNode=?,
  ~leaf: DupLabelsTypes.treeLeaf=?,
) => React.element = "DupLabels"
