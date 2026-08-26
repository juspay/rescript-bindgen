type __type = {
  color?: string,
}
type deeppartialPartialHealTokensDeepD1D2D3D4D5Config = {
  d6?: __type,
}
type deeppartialPartialHealTokensDeepD1D2D3D4Config = {
  d5?: deeppartialPartialHealTokensDeepD1D2D3D4D5Config,
}
type deeppartialPartialHealTokensDeepD1D2D3Config = {
  d4?: deeppartialPartialHealTokensDeepD1D2D3D4Config,
}
type deeppartialPartialHealTokensDeepD1D2Config = {
  d3?: deeppartialPartialHealTokensDeepD1D2D3Config,
}
type deeppartialPartialHealTokensDeepD1Config = {
  d2?: deeppartialPartialHealTokensDeepD1D2Config,
}
type deeppartialPartialHealTokensDeepConfig = {
  d1?: deeppartialPartialHealTokensDeepD1Config,
}
type deeppartialPartialHealTokensConfig = {
  label?: string,
  count?: int,
  active?: bool,
  size?: float,
  deep?: deeppartialPartialHealTokensDeepConfig,
}
type ordTaggedCs7n2 = {
  _format: string,  // ⚪ loose — was `"fmtA"`
  nested: deeppartialPartialHealTokensDeepConfig,
  v: string,
}
type ordTaggedJst4h = {
  _format: [#"fmtA"],
  nested: deeppartialPartialHealTokensDeepConfig,
  v: string,
}
