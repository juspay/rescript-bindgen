// #194: abstract handle — obtain a `t` from an API call that returns it (or your own
// Webapi/DOM binding for a host global); this module does not construct one.
type t = InstanceTypes.demoHandle
@send external poll: (t) => unit = "poll"
@get external id: t => float = "id"
