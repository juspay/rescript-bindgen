type csstypeDeeppartialWideningTokensTitleConfig = {
  color?: string,
  fontSize?: string,
}
type csstypeDeeppartialWideningTokensConfig = {
  title?: csstypeDeeppartialWideningTokensTitleConfig,
}
type customArm = {
  custom: string,
}
module CsstypeDeeppartialWideningMixedRecord = {
  type t
  external fromTag: [#"-moz-initial" | #"inherit" | #"initial" | #"unset" | #"aliceblue" | #"antiquewhite" | #"currentcolor"] => t = "%identity"
  external fromString: string => t = "%identity"
  external asString: t => (string) = "%identity"
  external fromCustomArm: customArm => t = "%identity"
  external asCustomArm: t => (customArm) = "%identity"
}
module CsstypeDeeppartialWideningMixedArray = {
  type t
  external fromTag: [#"-moz-initial" | #"inherit" | #"initial" | #"unset" | #"aliceblue" | #"antiquewhite" | #"currentcolor"] => t = "%identity"
  external fromString: string => t = "%identity"
  external asString: t => (string) = "%identity"
  external fromColors: array<string> => t = "%identity"
  external asColors: t => (array<string>) = "%identity"
}
