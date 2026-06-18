@module("demo") @react.component
external make: (
  ~d: SvgPathArrayTypes.stringOrValueArray=?,
  ~box: (float, float)=?,
) => React.element = "Path"
