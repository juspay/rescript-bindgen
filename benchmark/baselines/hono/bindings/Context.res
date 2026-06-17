type t = InstanceTypes.context
@new @module("hono") external make: (~req: WebTypes.request, ~options: TypesTypes.contextOptions=?, unit) => t = "Context"
@send external render: (t, ~content: promise<string>) => promise<WebTypes.response> = "render"
@send external setLayout: (t, ~layout: TypesTypes.typesLayoutConfig => 'a) => TypesTypes.typesLayoutConfig => 'a = "setLayout"
@send external getLayout: (t) => TypesTypes.typesLayoutConfig => 'a = "getLayout"
@send external setRenderer: (t, ~renderer: promise<string> => promise<WebTypes.response>) => unit = "setRenderer"
// ⚪ loose: `header` has a param/return widened to `string`.
@send external header: (t, ~name: string, ~value: UtilsTypes.baseMime=?, ~options: TypesTypes.setHeadersOptions=?, unit) => unit = "header"
@send external status: (t, ~status: CommonTypes.v100OrV101OrV102OrV103OrV200OrV201OrV202OrV203OrV204OrV205OrV206OrV207OrV208OrV226OrV300OrV301OrV302OrV303OrV304OrV305OrV306OrV307OrV308OrV400OrV401OrV402OrV403OrV404OrV405OrV406OrV407OrV408OrV409OrV410OrV411OrV412OrV413OrV414OrV415OrV416OrV417OrV418OrV421OrV422OrV423OrV424OrV425OrV426OrV428OrV429OrV431OrV451OrV500OrV501OrV502OrV503OrV504OrV505OrV506OrV507OrV508OrV510OrV511OrV1) => unit = "status"
// 🛑 BROKEN: `set` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external set: (t, ~key: string, ~value: string) => unit = "set"
// 🛑 BROKEN: `get` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external get: (t, ~key: string) => string = "get"
// ⚠️ REVIEW: `newResponse` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@send external newResponse: (t, ~data: string, ~status: CommonTypes.v100OrV101OrV102OrV103OrV200OrV201OrV202OrV203OrV204OrV205OrV206OrV207OrV208OrV226OrV300OrV301OrV302OrV303OrV304OrV305OrV306OrV307OrV308OrV400OrV401OrV402OrV403OrV404OrV405OrV406OrV407OrV408OrV409OrV410OrV411OrV412OrV413OrV414OrV415OrV416OrV417OrV418OrV421OrV422OrV423OrV424OrV425OrV426OrV428OrV429OrV431OrV451OrV500OrV501OrV502OrV503OrV504OrV505OrV506OrV507OrV508OrV510OrV511OrV1=?, ~headers: TypesTypes.headerRecord=?, unit) => WebTypes.response = "newResponse"
// 🛑 BROKEN: `body` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external body: (t, ~data: string, ~status: string=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.typesValueConfig = "body"
// 🛑 BROKEN: `text` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external text: (t, ~text: string, ~status: string=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.typesValueConfig = "text"
// 🛑 BROKEN: `json` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external json: (t, ~object: string, ~status: string=?, ~headers: TypesTypes.headerRecord=?, unit) => TypesTypes.typesValueConfig = "json"
// 🛑 BROKEN: `html` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external html: (t, ~html: string, ~status: CommonTypes.v100OrV102OrV103OrV200OrV201OrV202OrV203OrV206OrV207OrV208OrV226OrV300OrV301OrV302OrV303OrV305OrV306OrV307OrV308OrV400OrV401OrV402OrV403OrV404OrV405OrV406OrV407OrV408OrV409OrV410OrV411OrV412OrV413OrV414OrV415OrV416OrV417OrV418OrV421OrV422OrV423OrV424OrV425OrV426OrV428OrV429OrV431OrV451OrV500OrV501OrV502OrV503OrV504OrV505OrV506OrV507OrV508OrV510OrV511OrV1=?, ~headers: TypesTypes.headerRecord=?, unit) => string = "html"
// 🛑 BROKEN: `redirect` has an `unknown`/`any` — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@send external redirect: (t, ~location: string, ~status: string=?, unit) => TypesTypes.typesValueConfig = "redirect"
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
