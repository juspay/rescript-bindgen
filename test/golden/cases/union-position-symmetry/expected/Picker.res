type props<'a> = {
  prop?: UnionPositionSymmetryTypes.Anon.t,  // ⓘ was `Anon` — opaque; build with Anon.fromUnionPositionSymmetryPropConfig / Anon.fromUnionPositionSymmetryPropConfig2
  arr?: array<UnionPositionSymmetryTypes.Anon.t>,  // ⓘ was `Anon` — opaque; build with Anon.fromUnionPositionSymmetryPropConfig / Anon.fromUnionPositionSymmetryPropConfig2
  holder?: UnionPositionSymmetryTypes.holder,
  singleObj?: UnionPositionSymmetryTypes.numberOrUnionPositionSymmetrySingleObjConfig,
  onReadable?: UnionPositionSymmetryTypes.Anon.t => unit,  // ⓘ was `Anon` — opaque; build with Anon.fromUnionPositionSymmetryPropConfig / Anon.fromUnionPositionSymmetryPropConfig2
  onConstructOnly?: 'a => unit,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  propConstructOnly?: UnionPositionSymmetryTypes.ConstructOnly.t,  // ⓘ was `ConstructOnly` — opaque; build with ConstructOnly.fromUnionPositionSymmetryPropConfig / ConstructOnly.fromUnionPositionSymmetryPropConfig2 / ConstructOnly.auto
}

@module("demo")
external make: React.component<props<'a>> = "Picker"
