type props = {
  userId: BrandedTypesTypes.userId,
  count: BrandedTypesTypes.count,
  token: BrandedTypesTypes.token,
}

@module("demo")
external make: React.component<props> = "BrandedTypes"
