@module("demo") @react.component
external make: (
  ~m: CoveragePapercutsTypes.mergedList,
) => React.element = "Merged"
