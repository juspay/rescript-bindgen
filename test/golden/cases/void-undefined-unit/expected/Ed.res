type props = {
  paramVoid?: unit => float,
  paramUndef?: unit => float,
  voidThenValue?: (unit, float) => unit,
  retVoid?: float => unit,
  noArg?: unit => float,
  onAttach?: (unit => float, option<string>) => VoidUndefinedUnitTypes.disposable,
  tokens?: VoidUndefinedUnitTypes.paddingTokens,
  voidArray?: array<unit>,
  directMaybe?: string,
  aliasedMaybe: option<string>,
  optionalAliasedMaybe?: string,
  maybeArray?: array<option<string>>,
  maybePromise?: promise<option<string>>,
  maybeDict?: Dict.t<option<string>>,
  maybeTuple?: (option<string>, float),
  nestedMaybe?: VoidUndefinedUnitTypes.nestedMaybe,
  callbackMaybe?: option<string> => option<string>,
  callbackOptionalMaybe?: option<string> => unit,
  callbackUndefined?: option<string> => option<string>,
  callbackNullish?: Nullable.t<string> => Nullable.t<string>,
  multiMaybe?: unit => option<CommonTypes.stringOrNumber>,
}

@module("demo")
external make: React.component<props> = "Ed"
