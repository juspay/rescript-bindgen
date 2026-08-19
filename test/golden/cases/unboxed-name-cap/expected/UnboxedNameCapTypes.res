type sizeCfg = {
  px: float,
}
@unboxed type fitContentKeywordEtc177kd = @as("fitContentKeyword") FitContentKeyword | @as("maxContentKeyword") MaxContentKeyword | @as("minContentKeyword") MinContentKeyword | @as("intrinsicKeyword") IntrinsicKeyword | @as("autoKeyword") AutoKeyword | Num(float) | SizeCfg(sizeCfg)
