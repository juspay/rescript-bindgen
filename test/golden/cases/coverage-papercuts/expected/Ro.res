@module("demo") @react.component
external make: (
  ~pure: array<string>,
  ~hybrid: CoveragePapercutsTypes.roHybrid,
) => React.element = "Ro"
