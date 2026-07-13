type config = {
  url: string,
  retries?: float,
}
module Client = {
  type t
  external asFn: t => (string => promise<string>) = "%identity"
  @get external defaults: t => config = "defaults"
  @send external create: (t, config) => t = "create"
}
