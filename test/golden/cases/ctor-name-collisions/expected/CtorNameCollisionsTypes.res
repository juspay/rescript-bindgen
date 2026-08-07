type operator =
  | @as("!=") ValueOperator2
  | @as(">") Value2
type gapUnit =
  | @as("value") ValueGapUnit
  | @as("percent") Percent
type lineCase =
  | @as("Solid") SolidLineCase
  | @as("Dashed") Dashed
type fillCase =
  | @as("solid") SolidFillCase
  | @as("hatched") Hatched
type level =
  | @as(0) V0Level
  | @as(1) V1Level
type digit =
  | @as("0") V0Digit
  | @as("1") V1Digit
type squatter =
  | @as("value operator") ValueOperator
  | @as("other") Other
type casing =
  | @as("Mixed") MixedCasing
  | @as("Upper") Upper
type strokeStyle =
  | @as("dotted") Dotted
  | @as("wavy") Wavy
type borderStyle =
  | @as("dotted") Dotted
  | @as("groove") Groove
type marker = {
  id: string,
}
@unboxed type mixedOrMarker = @as("mixed") MixedOrMarker | Marker(marker)
