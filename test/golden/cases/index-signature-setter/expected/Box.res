@module("demo") @react.component
external make: (
  ~style: IndexSignatureSetterTypes.cssObject=?,
  ~title: string=?,
) => React.element = "Box"
