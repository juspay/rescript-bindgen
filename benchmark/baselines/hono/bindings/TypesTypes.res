type typesTarget =
  | @as("json") Json
  | @as("form") Form
  | @as("query") Query
  | @as("param") Param
  | @as("header") Header
  | @as("cookie") Cookie
type fetchEventLike = {
  request: WebTypes.request,
  respondWith: promise<WebTypes.response> => unit,
  passThroughOnException: unit => unit,
  waitUntil: promise<unit> => unit,
}
type executionContext = {
  waitUntil: promise<JSON.t> => unit,
  passThroughOnException: unit => unit,
  props: string,  // 🛑 BROKEN — contains `any`
  exports?: string,  // 🛑 BROKEN — contains `any`
}
module TypesContextOptionsExecutionCtx = {
  type t
  external fromFetchEventLike: fetchEventLike => t = "%identity"
  external fromExecutionContext: executionContext => t = "%identity"
}
type contextOptions = {
  env?: string,  // ⚪ loose — was `E["Bindings"]`
  executionCtx?: TypesContextOptionsExecutionCtx.t,
  notFoundHandler?: InstanceTypes.context => promise<WebTypes.response>,
  matchResult?: string,  // ⚪ loose — was `Result<[H, RouterRoute]>`
  path?: string,
}
type typesLayoutConfig = {
  @as("Layout") layout: Dict.t<string> => string,  // 🛑 BROKEN — contains `any`
}
type setHeadersOptions = {
  append?: bool,
}
type headerRecord = {
  @as("Content-Type") contentType: CommonTypes.stringOrStringArray,
}
type typesValueConfig = {
  ...JsxDOM.domProps,
  _data: string,  // 🛑 BROKEN — contains `unknown`
  _status: string,  // 🛑 BROKEN — contains `unknown`
  _format: string,  // ⚪ loose — was `"body"`
}
type typesBodyCacheConfig = {
  json?: string,  // 🛑 BROKEN — contains `any`
  text?: string,
  arrayBuffer?: string,  // ⚪ loose — was `ArrayBuffer`
  blob?: WebTypes.blob,
  formData?: Webapi.FormData.t,
}
type routerRoute = {
  basePath: string,
  path: string,
  method: string,
  handler: (InstanceTypes.context, unit => promise<unit>) => string,  // 🛑 BROKEN — contains `any`
}
module MatchTarget = {
  type t
  external fromTuple2: ((array<array<JSON.t>>, array<string>)) => t = "%identity"
  external fromArray: array<array<array<JSON.t>>> => t = "%identity"
}
type router = {
  name: string,
  add: (string, string, ((InstanceTypes.context, unit => string) => string, routerRoute)) => unit,  // 🛑 BROKEN — contains `any` — was `Promise<void>`
  match: (string, string) => MatchTarget.t,
}
type typesHonoOptionsGetPathConfig = {
  env?: string,  // ⚪ loose — was `E["Bindings"]`
}
type honoOptions = {
  strict?: bool,
  router?: router,
  getPath?: (WebTypes.request, option<typesHonoOptionsGetPathConfig>) => string,
}
type httpResponseError = {
  ...JsxDOM.domProps,
  getResponse: unit => WebTypes.response,
}
type typesOptionsConfig = {
  optionHandler?: InstanceTypes.context => JSON.t,
  replaceRequest?: CommonTypes.typesOptionsReplaceRequest,
}
@unboxed type typesOptionsConfigOptions = Fn(InstanceTypes.context => JSON.t) | TypesOptionsConfig(typesOptionsConfig)
module TypesHandler = {
  type t
  external fromError: JsError.t => t = "%identity"
  external fromHTTPResponseError: httpResponseError => t = "%identity"
}
module TypesInput = {
  type t
  external fromString: string => t = "%identity"
  external fromRequest: WebTypes.request => t = "%identity"
  external fromURL: WebTypes.url => t = "%identity"
}
