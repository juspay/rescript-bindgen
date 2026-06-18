@module("demo") @react.component
external make: (
  ~d: SvgPathArrayTypes.stringOrSegTArray=?,
  ~box: (float, float)=?,
) => React.element = "Path"
