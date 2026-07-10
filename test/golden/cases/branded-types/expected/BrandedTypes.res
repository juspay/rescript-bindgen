@module("demo") @react.component
external make: (
  ~userId: BrandedTypesTypes.userId,
  ~count: BrandedTypesTypes.count,
  ~token: BrandedTypesTypes.token,
) => React.element = "BrandedTypes"
