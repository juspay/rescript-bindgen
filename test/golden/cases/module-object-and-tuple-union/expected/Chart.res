@module("demo") @react.component
external make: (
  ~engine: InstanceTypes.chartEngineModule=?,
  ~updateArgs: array<bool>=?,
  ~mixedArgs: string=?,  // ⚪ loose — was `[string] | [string, number]`
  ~pair: (float, float)=?,
) => React.element = "Chart"
