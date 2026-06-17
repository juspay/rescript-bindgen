@module("demo") @react.component
external make: (
  ~annotations: array<RecursiveTypeParamCycleTypes.annotationControlPoint<'a>>=?,
) => React.element = "Chart"
