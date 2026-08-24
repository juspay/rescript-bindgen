type t = InstanceTypes.honoRequest
// ⚪ loose: `make` has a param/return widened to `string`.
@new @module("hono") external make: (~request: WebTypes.request, ~path: string=?, ~matchResult: string=?, unit) => t = "HonoRequest"
// ⚪ loose: `param` has a param/return widened to `string`.
@send external param: (t, ~key: string) => string = "param"
@send external query: (t, ~key: string) => string = "query"
@send external queries: (t, ~key: string) => array<string> = "queries"
@send external header: (t, ~name: UtilsTypes.requestHeader) => string = "header"
// ⚪ loose: `parseBody` has a param/return widened to `string`.
@send external parseBody: (t, ~options: UtilsTypes.utilsValueConfig=?, unit) => promise<Dict.t<string>> = "parseBody"
// 🛑 BROKEN: `json` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external json: (t) => promise<string> = "json"
@send external text: (t) => promise<string> = "text"
// ⚪ loose: `arrayBuffer` has a param/return widened to `string`.
@send external arrayBuffer: (t) => promise<string> = "arrayBuffer"
// ⚪ loose: `bytes` has a param/return widened to `string`.
@send external bytes: (t) => promise<string> = "bytes"
@send external blob: (t) => promise<WebTypes.blob> = "blob"
@send external formData: (t) => promise<Webapi.FormData.t> = "formData"
@send external addValidatedData: (t, ~target: TypesTypes.typesTarget, ~data: JSON.t) => unit = "addValidatedData"
// ⚪ loose: `valid` has a param/return widened to `string`.
@send external valid: (t, ~target: TypesTypes.typesValue) => string = "valid"
@get external raw: t => WebTypes.request = "raw"
@get external routeIndex: t => float = "routeIndex"
@get external path: t => string = "path"
@get external bodyCache: t => TypesTypes.typesBodyCacheConfig = "bodyCache"
@get external url: t => string = "url"
@get external method: t => string = "method"
@get external matchedRoutes: t => array<TypesTypes.routerRoute> = "matchedRoutes"
@get external routePath: t => string = "routePath"
