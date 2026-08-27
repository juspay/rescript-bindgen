type props = {
  gap?: CommonTypes.stringOrNumber,
  space?: float,
  onlyOpen?: string,
  brand: OpenStringIdiomTypes.openStringIdiomBrand,
  color?: OpenStringIdiomTypes.openStringIdiomColor,
  deep?: OpenStringIdiomTypes.openStringIdiomDeepConfig,
  money?: OpenStringIdiomTypes.money,
  ch?: OpenStringIdiomTypes.charThing,
  mixedMoney?: OpenStringIdiomTypes.stringOrMoney,
}

@module("demo")
external make: React.component<props> = "Demo"
