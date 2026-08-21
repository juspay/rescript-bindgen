type t = InstanceTypes.context
@new @module("hono") external make: (~req: WebTypes.request, ~options: TypesTypes.contextOptions=?, unit) => t = "Context"
@send external render: (t, ~content: promise<string>) => promise<WebTypes.response> = "render"
@send external setLayout: (t, ~layout: TypesTypes.typesLayoutConfig => 'a) => TypesTypes.typesLayoutConfig => 'a = "setLayout"
@send external getLayout: (t) => TypesTypes.typesLayoutConfig => 'a = "getLayout"
@send external setRenderer: (t, ~renderer: promise<string> => promise<WebTypes.response>) => unit = "setRenderer"
// ⚪ loose: `header` has a param/return widened to `string`.
@send external header: (t, ~name: string, ~value: UtilsTypes.baseMime=?, ~options: TypesTypes.setHeadersOptions=?, unit) => unit = "header"
@send external status: (t, ~status: CommonTypes.statusCode) => unit = "status"
// ⚪ loose: `set` has a param/return widened to `string`.
@send external set: (t, ~key: string, ~value: string) => unit = "set"
// ⚪ loose: `get` has a param/return widened to `string`.
@send external get: (t, ~key: string) => string = "get"
// ⚠️ REVIEW: `newResponse` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external newResponse: (t, ~data: string, ~status: CommonTypes.statusCode=?, ~headers: TypesTypes.headerRecord=?, unit) => WebTypes.response = "newResponse"
@send external body: (t, ~data: 'b, ~status: 'c=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.typesValueConfigV1xxoa<'b, 'c> = "body"
@send external text: (t, ~text: 'b, ~status: 'c=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.typesValueConfigG2ock<'b, 'c> = "text"
// ⚠️ REVIEW: `json` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external json: (t, ~object: string, ~status: 'c=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.jsonRespondReturn<'c> = "json"
// ⚪ loose: `html` has a param/return widened to `string`.
@send external html: (t, ~html: promise<string>, ~status: CommonTypes.contentfulStatusCode=?, ~headers: TypesTypes.headerRecord=?, unit) => string = "html"
// ⚠️ REVIEW: `redirect` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external redirect: (t, ~location: string, ~status: 'b=?, unit) => TypesTypes.typesValueConfigWli51<'b> = "redirect"
@send external notFound: (t) => promise<WebTypes.response> = "notFound"
// ⚪ loose: `env` has a param/return widened to `string`.
@get external env: t => string = "env"
@get external finalized: t => bool = "finalized"
@get external error: t => JsError.t = "error"
@get external req: t => InstanceTypes.honoRequest = "req"
@get external event: t => TypesTypes.fetchEventLike = "event"
@get external executionCtx: t => TypesTypes.executionContext = "executionCtx"
@get external res: t => WebTypes.response = "res"
@get external var: t => JSON.t = "var"
@set external resSet: (t, WebTypes.response) => unit = "res"
