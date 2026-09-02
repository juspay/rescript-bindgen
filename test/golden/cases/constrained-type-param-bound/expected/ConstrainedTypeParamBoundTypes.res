type constrainedTypeParamBoundSetSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type flag =
  | @as("on") On
  | @as("off") Off
type constrainedTypeParamBoundHomoParamVTag =
  | @as("a") AParamVTag
  | @as("b") BParamVTag
type constrainedTypeParamBoundValue =
  | @as("on") On
  | @as("off") Off
type wrap<'a> = {
  v: 'a,
}
type wrapString = {
  v: string,
}
type parametersDictDomElement = {
  state: Dict.t<JSON.t>,
  el: Dom.element,
}
type outerString = {
  inner: wrapString,
}
type rec selfWrapString = {
  v: string,
  next?: selfWrapString,
}
type flaggedString = {
  v: string,
  kind: flag,
}
type d7<'a> = {
  v: 'a,
  n: wrap<'a>,
}
type e7String = {
  v: string,
}
type e6String = {
  v: string,
  n: e7String,
}
type e5String = {
  v: string,
  n: e6String,
}
type e4String = {
  v: string,
  n: e5String,
}
type e3String = {
  v: string,
  n: e4String,
}
type e2String = {
  v: string,
  n: e3String,
}
type e1String = {
  v: string,
  n: e2String,
}
type constrainedTypeParamBoundTvParamVConfigV3dsmi<'a> = {
  tag: [#"a"],
  x: 'a,
}
type constrainedTypeParamBoundTvParamVConfigVfds1<'a> = {
  tag: [#"b"],
  y: 'a,
  extra: float,
}
type constrainedTypeParamBoundHomoParamConfigString = {
  tag: constrainedTypeParamBoundHomoParamVTag,
  x: string,
}
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with ATVString({…}); `tag` is auto-filled by @tag.
@tag("tag")
type tVString =
  | @as("a") ATVString({x: string})
  | @as("b") BTVString({y: string, extra: float})
type recWithTVString = {
  name: string,
  u: tVString,
}
type otherArm = {
  o: float,
}
module TV = {
  type t
  external fromConstrainedTypeParamBoundTvParamVConfig: constrainedTypeParamBoundTvParamVConfigV3dsmi<'a> => t = "%identity"
  external asConstrainedTypeParamBoundTvParamVConfig: t => (constrainedTypeParamBoundTvParamVConfigV3dsmi<'a>) = "%identity"
  external fromConstrainedTypeParamBoundTvParamVConfig2: constrainedTypeParamBoundTvParamVConfigVfds1<'a> => t = "%identity"
  external asConstrainedTypeParamBoundTvParamVConfig2: t => (constrainedTypeParamBoundTvParamVConfigVfds1<'a>) = "%identity"
}
module ConstrainedTypeParamBoundUnionRoundTripX = {
  type t
  external fromOtherArm: otherArm => t = "%identity"
  external asOtherArm: t => (otherArm) = "%identity"
  external fromWrap: wrap<'a> => t = "%identity"
  external asWrap: t => (wrap<'a>) = "%identity"
}
