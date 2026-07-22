type props = {
  pure: array<string>,
  hybrid: CoveragePapercutsTypes.roHybrid,
}

@module("demo")
external make: React.component<props> = "Ro"
