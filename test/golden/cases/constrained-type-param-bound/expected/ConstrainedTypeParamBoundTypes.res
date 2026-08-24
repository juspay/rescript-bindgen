type constrainedTypeParamBoundSetSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type constrainedTypeParamBoundValue =
  | @as("on") On
  | @as("off") Off
type wrap<'a> = {
  v: 'a,
}
type otherArm = {
  o: float,
}
module ConstrainedTypeParamBoundUnionRoundTripX = {
  type t
  external fromOtherArm: otherArm => t = "%identity"
  external asOtherArm: t => (otherArm) = "%identity"
  external fromWrap: wrap<'a> => t = "%identity"
  external asWrap: t => (wrap<'a>) = "%identity"
}
