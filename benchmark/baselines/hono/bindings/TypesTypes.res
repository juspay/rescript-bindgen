type target =
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
module ExecutionCtx = {
  type t
  external fromFetchEventLike: fetchEventLike => t = "%identity"
  external fromExecutionContext: executionContext => t = "%identity"
}
type contextOptions = {
  env: string,
  executionCtx?: ExecutionCtx.t,
  notFoundHandler?: InstanceTypes.context => promise<WebTypes.response>,
  matchResult?: string,
  path?: string,
}
type layoutConfig = {
  @as("Layout") layout: Dict.t<string> => string,
}
type setHeadersOptions = {
  append?: bool,
}
type headerRecord = {
  @as("Content-Type") contentType: CommonTypes.stringOrStringArray,
}
type valueConfig = {
  ...JsxDOM.domProps,
  _data: string,
  _status: string,
  _format: string,
}
type bodyCacheConfig = {
  json?: string,
  text?: string,
  arrayBuffer?: string,
  blob?: WebTypes.blob,
  formData?: Webapi.FormData.t,
}
type routerRoute<'a> = {
  basePath: string,
  path: string,
  method: string,
  handler: (InstanceTypes.context, unit => promise<unit>) => 'a,
}
type router = {
  name: string,
  add: (string, string, string) => unit,
  match: (string, string) => string,
}
type getPathConfig = {
  env?: string,
}
type honoOptions = {
  strict?: bool,
  router?: router,
  getPath?: (WebTypes.request, option<getPathConfig>) => string,
}
type optionsConfig = {
  optionHandler?: InstanceTypes.context => JSON.t,
  replaceRequest?: CommonTypes.replaceRequest,
}
@unboxed type optionsConfigOptions = Fn(InstanceTypes.context => JSON.t) | OptionsConfig(optionsConfig)
module Input = {
  type t
  external fromString: string => t = "%identity"
  external fromRequest: WebTypes.request => t = "%identity"
  external fromURL: WebTypes.url => t = "%identity"
}
