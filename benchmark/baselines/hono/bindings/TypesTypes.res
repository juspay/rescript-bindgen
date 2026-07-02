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
  props: string,
  exports?: string,
}
module TypesContextOptionsExecutionCtx = {
  type t
  external fromFetchEventLike: fetchEventLike => t = "%identity"
  external fromExecutionContext: executionContext => t = "%identity"
}
type contextOptions = {
  env?: string,
  executionCtx?: TypesContextOptionsExecutionCtx.t,
  notFoundHandler?: InstanceTypes.context => promise<WebTypes.response>,
  matchResult?: string,
  path?: string,
}
type typesLayoutConfig = {
  @as("Layout") layout: Dict.t<string> => string,
}
type setHeadersOptions = {
  append?: bool,
}
type headerRecord = {
  @as("Content-Type") contentType: CommonTypes.stringOrStringArray,
}
type typesValueConfig = {
  ...JsxDOM.domProps,
  _data: string,
  _status: string,
  _format: string,
}
type typesBodyCacheConfig = {
  json?: string,
  text?: string,
  arrayBuffer?: string,
  blob?: WebTypes.blob,
  formData?: Webapi.FormData.t,
}
type routerRoute = {
  basePath: string,
  path: string,
  method: string,
  handler: (InstanceTypes.context, unit => promise<unit>) => string,
}
type router = {
  name: string,
  add: (string, string, ((InstanceTypes.context, unit => string) => string, routerRoute)) => unit,
  match: (string, string) => string,
}
type typesHonoOptionsGetPathConfig = {
  env?: string,
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
