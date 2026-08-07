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
  external asFetchEventLike: t => (fetchEventLike) = "%identity"
  external fromExecutionContext: executionContext => t = "%identity"
  external asExecutionContext: t => (executionContext) = "%identity"
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
  @as("Access-Control-Allow-Credentials") accessControlAllowCredentials?: CommonTypes.stringOrStringArray,
  @as("Access-Control-Allow-Headers") accessControlAllowHeaders?: CommonTypes.stringOrStringArray,
  @as("Access-Control-Allow-Methods") accessControlAllowMethods?: CommonTypes.stringOrStringArray,
  @as("Access-Control-Allow-Origin") accessControlAllowOrigin?: CommonTypes.stringOrStringArray,
  @as("Access-Control-Expose-Headers") accessControlExposeHeaders?: CommonTypes.stringOrStringArray,
  @as("Access-Control-Max-Age") accessControlMaxAge?: CommonTypes.stringOrStringArray,
  @as("Age") age?: CommonTypes.stringOrStringArray,
  @as("Allow") allow?: CommonTypes.stringOrStringArray,
  @as("Cache-Control") cacheControl?: CommonTypes.stringOrStringArray,
  @as("Clear-Site-Data") clearSiteData?: CommonTypes.stringOrStringArray,
  @as("Content-Disposition") contentDisposition?: CommonTypes.stringOrStringArray,
  @as("Content-Encoding") contentEncoding?: CommonTypes.stringOrStringArray,
  @as("Content-Language") contentLanguage?: CommonTypes.stringOrStringArray,
  @as("Content-Length") contentLength?: CommonTypes.stringOrStringArray,
  @as("Content-Location") contentLocation?: CommonTypes.stringOrStringArray,
  @as("Content-Range") contentRange?: CommonTypes.stringOrStringArray,
  @as("Content-Security-Policy") contentSecurityPolicy?: CommonTypes.stringOrStringArray,
  @as("Content-Security-Policy-Report-Only") contentSecurityPolicyReportOnly?: CommonTypes.stringOrStringArray,
  @as("Cookie") cookie?: CommonTypes.stringOrStringArray,
  @as("Cross-Origin-Embedder-Policy") crossOriginEmbedderPolicy?: CommonTypes.stringOrStringArray,
  @as("Cross-Origin-Opener-Policy") crossOriginOpenerPolicy?: CommonTypes.stringOrStringArray,
  @as("Cross-Origin-Resource-Policy") crossOriginResourcePolicy?: CommonTypes.stringOrStringArray,
  @as("Date") date?: CommonTypes.stringOrStringArray,
  @as("ETag") eTag?: CommonTypes.stringOrStringArray,
  @as("Expires") expires?: CommonTypes.stringOrStringArray,
  @as("Last-Modified") lastModified?: CommonTypes.stringOrStringArray,
  @as("Location") location?: CommonTypes.stringOrStringArray,
  @as("Permissions-Policy") permissionsPolicy?: CommonTypes.stringOrStringArray,
  @as("Pragma") pragma?: CommonTypes.stringOrStringArray,
  @as("Retry-After") retryAfter?: CommonTypes.stringOrStringArray,
  @as("Save-Data") saveData?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-Prefers-Color-Scheme") secCHPrefersColorScheme?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-Prefers-Reduced-Motion") secCHPrefersReducedMotion?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA") secCHUA?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Arch") secCHUAArch?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Bitness") secCHUABitness?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Form-Factor") secCHUAFormFactor?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Full-Version") secCHUAFullVersion?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Full-Version-List") secCHUAFullVersionList?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Mobile") secCHUAMobile?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Model") secCHUAModel?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Platform") secCHUAPlatform?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-Platform-Version") secCHUAPlatformVersion?: CommonTypes.stringOrStringArray,
  @as("Sec-CH-UA-WoW64") secCHUAWoW64?: CommonTypes.stringOrStringArray,
  @as("Sec-Fetch-Dest") secFetchDest?: CommonTypes.stringOrStringArray,
  @as("Sec-Fetch-Mode") secFetchMode?: CommonTypes.stringOrStringArray,
  @as("Sec-Fetch-Site") secFetchSite?: CommonTypes.stringOrStringArray,
  @as("Sec-Fetch-User") secFetchUser?: CommonTypes.stringOrStringArray,
  @as("Sec-GPC") secGPC?: CommonTypes.stringOrStringArray,
  @as("Server") server?: CommonTypes.stringOrStringArray,
  @as("Server-Timing") serverTiming?: CommonTypes.stringOrStringArray,
  @as("Service-Worker-Navigation-Preload") serviceWorkerNavigationPreload?: CommonTypes.stringOrStringArray,
  @as("Set-Cookie") setCookie?: CommonTypes.stringOrStringArray,
  @as("Strict-Transport-Security") strictTransportSecurity?: CommonTypes.stringOrStringArray,
  @as("Timing-Allow-Origin") timingAllowOrigin?: CommonTypes.stringOrStringArray,
  @as("Trailer") trailer?: CommonTypes.stringOrStringArray,
  @as("Transfer-Encoding") transferEncoding?: CommonTypes.stringOrStringArray,
  @as("Upgrade") upgrade?: CommonTypes.stringOrStringArray,
  @as("Vary") vary?: CommonTypes.stringOrStringArray,
  @as("WWW-Authenticate") wWWAuthenticate?: CommonTypes.stringOrStringArray,
  @as("Warning") warning?: CommonTypes.stringOrStringArray,
  @as("X-Content-Type-Options") xContentTypeOptions?: CommonTypes.stringOrStringArray,
  @as("X-DNS-Prefetch-Control") xDNSPrefetchControl?: CommonTypes.stringOrStringArray,
  @as("X-Frame-Options") xFrameOptions?: CommonTypes.stringOrStringArray,
  @as("X-Permitted-Cross-Domain-Policies") xPermittedCrossDomainPolicies?: CommonTypes.stringOrStringArray,
  @as("X-Powered-By") xPoweredBy?: CommonTypes.stringOrStringArray,
  @as("X-Robots-Tag") xRobotsTag?: CommonTypes.stringOrStringArray,
  @as("X-XSS-Protection") xXSSProtection?: CommonTypes.stringOrStringArray,
}
type typesValueConfig = {
  ...JsxDOM.domProps,
  _data: unit,
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
  external asTuple2: t => ((array<array<JSON.t>>, array<string>)) = "%identity"
  external fromArray: array<array<array<JSON.t>>> => t = "%identity"
  external asArray: t => (array<array<array<JSON.t>>>) = "%identity"
}
type router = {
  name: string,
  add: (string, string, ((InstanceTypes.context, unit => LibTypes.promise2) => string, routerRoute)) => unit,  // 🛑 BROKEN — contains `any`
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
  external asError: t => (JsError.t) = "%identity"
  external fromHTTPResponseError: httpResponseError => t = "%identity"
  external asHTTPResponseError: t => (httpResponseError) = "%identity"
}
module TypesInput = {
  type t
  external fromString: string => t = "%identity"
  external asString: t => (string) = "%identity"
  external fromRequest: WebTypes.request => t = "%identity"
  external asRequest: t => (WebTypes.request) = "%identity"
  external fromURL: WebTypes.url => t = "%identity"
  external asURL: t => (WebTypes.url) = "%identity"
}
