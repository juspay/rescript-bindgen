type disposable = {
  dispose: unit => unit,
}
type voidUndefinedUnitPaddingTokensDefaultConfig = {
  x: string,
  y: string,
}
type paddingTokens = {
  default: voidUndefinedUnitPaddingTokensDefaultConfig,
  aligned: voidUndefinedUnitPaddingTokensDefaultConfig,
  custom: unit,
  optionalNone?: unit,
}
type nestedMaybe = {
  direct?: string,
  aliased: option<string>,
}
