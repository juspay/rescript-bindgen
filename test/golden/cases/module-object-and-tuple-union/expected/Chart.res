type props = {
  engine?: InstanceTypes.chartEngineModule,
  updateArgs?: array<bool>,
  mixedArgs?: string,  // ⚪ loose — was `[string] | [string, number]`
  pair?: (float, float),
}

@module("demo")
external make: React.component<props> = "Chart"
