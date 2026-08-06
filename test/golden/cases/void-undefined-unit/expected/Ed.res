type props = {
  paramVoid?: unit => float,
  paramUndef?: unit => float,
  voidThenValue?: (unit, float) => unit,
  retVoid?: float => unit,
  noArg?: unit => float,
  onAttach?: (unit => float, option<string>) => VoidUndefinedUnitTypes.disposable,
  tokens?: VoidUndefinedUnitTypes.paddingTokens,
  voidArray?: array<unit>,
}

@module("demo")
external make: React.component<props> = "Ed"
