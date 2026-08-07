type props = {
  seed?: SignatureEncodingAmbiguityTypes.seed,
  one?: SignatureEncodingAmbiguityTypes.SetOne.t,  // ⓘ was `SetOne` — opaque; build with SetOne.fromTag / SetOne.fromAlpha / SetOne.fromBeta
  two?: SignatureEncodingAmbiguityTypes.SetTwo.t,  // ⓘ was `SetTwo` — opaque; build with SetTwo.fromTag / SetTwo.fromAlpha / SetTwo.fromBeta
}

@module("demo")
external make: React.component<props> = "Probe"
