type t = InstanceTypes.hono
@new @module("hono") external make: (~options: TypesTypes.honoOptions=?, unit) => t = "Hono"
// ⚠️ REVIEW: `get` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external get: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono2 = "get"
// ⚠️ REVIEW: `post` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external post: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono17 = "post"
// ⚠️ REVIEW: `put` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external put: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono30 = "put"
// ⚠️ REVIEW: `delete` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external delete: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono43 = "delete"
// ⚠️ REVIEW: `options` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external options: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono56 = "options"
// ⚠️ REVIEW: `patch` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external patch: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono69 = "patch"
// ⚠️ REVIEW: `all` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external all: (t, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono82 = "all"
// 🛑 BROKEN: `on` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external on: (t, ~method: string, ~path: string, ~handler: (InstanceTypes.context, unit => promise<unit>) => string) => TypesTypes.hono95 = "on"
// ⚠️ REVIEW: `use` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external use: (t, ~handlers: array<(InstanceTypes.context, unit => promise<unit>) => promise<string>>=?, unit) => TypesTypes.hono108 = "use"
@send external getPath: (t, ~request: WebTypes.request, ~options: TypesTypes.getPathConfig=?, unit) => string = "getPath"
// 🛑 BROKEN: `route` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external route: (t, ~path: string, ~app: TypesTypes.hono121) => TypesTypes.hono134 = "route"
// 🛑 BROKEN: `basePath` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external basePath: (t, ~path: string) => TypesTypes.hono147 = "basePath"
// ⚠️ REVIEW: `onError` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external onError: (t, ~handler: (string, InstanceTypes.context) => promise<WebTypes.response>) => TypesTypes.hono160 = "onError"
@send external notFound: (t, ~handler: InstanceTypes.context => promise<WebTypes.response>) => TypesTypes.hono160 = "notFound"
// 🛑 BROKEN: `mount` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external mount: (t, ~path: string, ~applicationHandler: (WebTypes.request, string) => promise<WebTypes.response>, ~options: TypesTypes.mountConfigOptions=?, unit) => TypesTypes.hono160 = "mount"
// ⚪ loose: `fetch` has a param/return widened to `string`.
@send external fetch: (t, ~request: WebTypes.request, ~env: string=?, ~executionCtx: TypesTypes.executionContext=?, unit) => promise<WebTypes.response> = "fetch"
// ⚪ loose: `request` has a param/return widened to `string`.
@send external request: (t, ~input: TypesTypes.Request.t, ~requestInit: string=?, ~env: string=?, ~executionCtx: TypesTypes.executionContext=?, unit) => promise<WebTypes.response> = "request"
@send external fire: (t) => unit = "fire"
@get external router: t => TypesTypes.router = "router"
@get external routes: t => array<TypesTypes.routerRoute> = "routes"
