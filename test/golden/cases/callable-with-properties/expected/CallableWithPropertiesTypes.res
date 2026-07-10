module Translator = {
  type t
  external asFn: t => (string => string) = "%identity"
  @get external locale: t => string = "locale"
  @send external setLocale: (t, string) => unit = "setLocale"
}
module Client = {
  type t
  external asFn: t => (string => promise<string>) = "%identity"
  @get external baseUrl: t => string = "baseUrl"
  @send external create: (t, string) => t = "create"
}
